# Converts markdown files in $PAGES_PATH to partial files on server start

PAGES_PATH = 'app/views/pages/'
MARKDOWNS_PATH = PAGES_PATH + 'markdowns/'
PARTIALS_PATH = PAGES_PATH + 'partials/'

FileUtils.rm_rf(PARTIALS_PATH)
FileUtils.mkdir(PARTIALS_PATH)

markdown_file_paths = Rake::FileList.new(MARKDOWNS_PATH + '*.md')

markdown_file_paths.each do |markdown_file_path|
  basename = File.basename(markdown_file_path, File.extname(markdown_file_path))
  partial_fullname = PARTIALS_PATH + '_' + basename + '.html.erb'

  html_content = MarkdownHelper.to_html(markdown_file_path)
  
  File.write(partial_fullname, html_content)
end
