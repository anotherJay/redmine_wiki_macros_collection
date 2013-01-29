require 'redmine'
require 'redcloth3'

Dir::foreach(File.join(File.dirname(__FILE__), 'lib')) do |file|
  next unless /\.rb$/ =~ file
  require file
end


Redmine::Plugin.register :redmine_wiki_macros_collection do
  name 'Redmine Wiki Macros Collection plugin'
  author 'Jason St. Louis'
  description 'A collection of hopefully useful wiki macros'
  version '0.0.1'
  url 'https://github.com/anotherJay/redmine_wiki_macros_collection'
  author_url 'http://github.com/anotherJay'
end
