require 'test/unit'
require 'rubygems'
require 'active_record'
require 'active_support'
require 'shoulda'

begin
  require 'rubygems'
  require 'redgreen'
rescue LoadError
  puts "** Error loading redgreen"
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
RAILS_ROOT = File.dirname(__FILE__)

# def log_to(stream)
#   ActiveRecord::Base.logger = Logger.new(stream)
#   ActiveRecord::Base.clear_active_connections!
# end
# 
# log_to STDOUT

ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3", 
<<<<<<< HEAD:test/test_helper.rb
  :dbfile => ":memory:"
=======
  :dbfile => "db/test.sqlite3"
>>>>>>> 71e1879ae843b82ad1ef7fa3ac304452df83ae8d:test/test_helper.rb
})

class Post < ActiveRecord::Base; end
class User < ActiveRecord::Base; end

ActiveRecord::Migration.verbose = false

load(File.dirname(__FILE__) + '/db/schema.rb')

# ActiveRecord::Migrator.migrate("db/migrate")

# CreatePosts.migrate(:up)
# CreateUsers.migrate(:up)

require 'chart_fu'
Object.send :include, ChartFu::Mixin