require 'rubygems'
require 'rake'
require 'rake/rdoctask'

task :default => :test

task :test do
  require 'rake/runtest'
  require 'monkeyspecdoc'
  Rake.run_tests 'test/chart_fu_test.rb'
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