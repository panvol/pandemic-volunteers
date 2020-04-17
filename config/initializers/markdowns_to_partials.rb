# convert md files to partial files
require 'kramdown'

PAGES_PATH = 'app/views/pages/'
MARKDOWNS_PATH = PAGES_PATH + 'markdowns/'
PARTIALS_PATH = PAGES_PATH + 'partials/'

FileUtils.rm_rf(PARTIALS_PATH)
FileUtils.mkdir(PARTIALS_PATH)

markdown_files = Rake::FileList.new(MARKDOWNS_PATH + '*.md')

markdown_files.each do |file|
  basename = File.basename(file, File.extname(file))
  partial_fullname = PARTIALS_PATH + '_' + basename + '.html.erb'

  content = Kramdown::Document.new(File.read(file)).to_html

  File.write(partial_fullname, content)
end
