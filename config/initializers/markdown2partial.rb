# convert md files to partial files
require 'kramdown'

PATH = 'app/views/pages/'
files = Rake::FileList.new(PATH + "*md")

files.each do |f|
  name = f.split(PATH).last.split('.').first

  content = Kramdown::Document.new(File.read(PATH + name + '.md')).to_html
  File.write(PATH + '_markdown_converted_' + name + '.html.erb', content)
end
