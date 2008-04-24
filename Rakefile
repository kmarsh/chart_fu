require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test" << "lib"
  t.test_files = FileList['test/*test.rb']
  t.verbose = true
end

desc 'Generate RDoc documentation for the chart_fu plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  files = ['README.markdown', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README.markdown" # page to start on
  rdoc.title = "chart_fu_"
  rdoc.rdoc_dir = 'doc' # rdoc output folder
  rdoc.options << '--inline-source'
end