# Converts markdown files in $PAGES_PATH to partial files on server start

class CustomHTMLRender < Redcarpet::Render::HTML
  def postprocess(full_document)
    """
    <div class=''>
      #{full_document}
    </div>
    """.html_safe
  end

  # Taken from https://github.com/vmg/redcarpet/issues/638
  # This is annoying. Redcarpet implements this id generation logic in C, and
  # AFAIK doesn't provide any hook for calling this method directly from Ruby.
  # See C code here: https://github.com/vmg/redcarpet/blob/f441dec42a5097530328b20e9d5ed1a025c600f7/ext/redcarpet/html.c#L273-L319
  def header_anchor(text)
    Nokogiri::HTML(Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true)).render("# #{text}")).css('h1')[0]["id"]
  end

  def anchorable(pretty_text, id = nil)
    id ||= pretty_text.parameterize
    """
      <span id='#{id}' class='anchorable'>
        #{pretty_text}
        <a href='##{id}'><i class='fas fa-link text-light'></i></a>
      </span>
    """.html_safe
  end

  def header(text, header_level)
    if header_level == 1
      """
      <div class='text-center container pb-5'>
        <p class='section-title font-weight-bold'>
          #{text}
        </p>
      </div>
      """.html_safe
    else
      if @options[:with_toc_data]
        id = header_anchor(text)
        text = anchorable(text, id)
      end

      """
      <h#{header_level} class='mt-5'>
        #{text}
      </h#{header_level}>
      """.html_safe
    end
  end

  # Called on links that are specifically called out
  def link(link, title, alt_text)
    "<a #{"target='_blank'" if LinkHelper.external_link?(link)} href='#{link}'>#{alt_text}</a>"
  end

  # Called on URLs
  def autolink(link, link_type)
    "<a #{"target='_blank'" if LinkHelper.external_link?(link)} href='#{link}'>#{link}</a>"
  end
end

renderer_opts = {
  with_toc_data: true
}

redcarpet_renderer = CustomHTMLRender.new(renderer_opts)

redcarpet_markdown = Redcarpet::Markdown.new(redcarpet_renderer)

PAGES_PATH = 'app/views/pages/'
MARKDOWNS_PATH = PAGES_PATH + 'markdowns/'
PARTIALS_PATH = PAGES_PATH + 'partials/'

FileUtils.rm_rf(PARTIALS_PATH)
FileUtils.mkdir(PARTIALS_PATH)

markdown_files = Rake::FileList.new(MARKDOWNS_PATH + '*.md')

markdown_files.each do |file|
  basename = File.basename(file, File.extname(file))
  partial_fullname = PARTIALS_PATH + '_' + basename + '.html.erb'

  html_content = redcarpet_markdown.render(File.read(file))

  File.write(partial_fullname, html_content)
end
