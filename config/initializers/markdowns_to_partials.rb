# Converts markdown files in $PAGES_PATH to partial files on server start

redcarpet_renderer = Redcarpet::Render::HTML.new(with_toc_data: true)
redcarpet_markdown = Redcarpet::Markdown.new(redcarpet_renderer, extensions = {})

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
