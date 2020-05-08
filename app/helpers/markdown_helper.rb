module MarkdownHelper
  class ArticleCardHTMLRender < Redcarpet::Render::Base
    def postprocess(full_document)
      """
      <div class='container'>
        <div class='card'>
          <div class='card-body bg-light'>
            <div class='row'>
              <div class='col-md-12'>
                #{full_document}
              </div>
            </div>
          </div>
        </div>
      </div>
      """.html_safe
    end

    def header(text, header_level)
      if header_level == 1
        """
        <h1 class='mt-2'>
          #{text}
        </h1>
        """
      elsif header_level == 6
        # Using sixth level headers instead of quotes
        # for descriptions due to:
        # https://github.com/vmg/redcarpet/issues/690
        """
        <blockquote class='blockquote'>
          #{text}
        </blockquote>
        """
      end
    end
  end

  class MarkdownHTMLRender < Redcarpet::Render::HTML
    def postprocess(full_document)
      """
      <div class='col-md-12'>
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
      """
    end

    def header(text, header_level)
      if header_level == 1
        """
        <div class='text-center pb-2'>
          <p class='section-title font-weight-bold'>
            #{text}
          </p>
        </div>
        """
      elsif header_level == 6
        # Using sixth level headers instead of quotes
        # for descriptions due to:
        # https://github.com/vmg/redcarpet/issues/690
        """
        <blockquote class='blockquote font-weight-bold text-center pb-5'>
          #{text}
        </blockquote>
        """
      else
        if @options[:with_toc_data]
          id = header_anchor(text)
          text = anchorable(text, id)
        end

        """
        <h#{header_level} class='mt-5'>
          #{text}
        </h#{header_level}>
        """
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

  RENDERER_OPTS = {
    with_toc_data: true
  }

  REDCARPET_MARKDOWN_HTML_RENDERER = MarkdownHTMLRender.new(RENDERER_OPTS)

  REDCARPET_MARKDOWN = Redcarpet::Markdown.new(REDCARPET_MARKDOWN_HTML_RENDERER)
  def self.to_html(markdown_file_path)
    markdown_content = File.read(markdown_file_path)
    cache_key = Digest::MD5.hexdigest(markdown_content)
    Rails.cache.fetch cache_key do
      REDCARPET_MARKDOWN.render(markdown_content)
    end
  end

  REDCARPET_ARTICLE_CARD_HTML_RENDERER = ArticleCardHTMLRender.new()

  REDCARPET_CARD = Redcarpet::Markdown.new(REDCARPET_ARTICLE_CARD_HTML_RENDERER)
  def self.to_card(markdown_file_path)
    markdown_content = File.read(markdown_file_path)
    REDCARPET_CARD.render(markdown_content)
  end

end
