require 'test/unit'
require 'rubygems'
require 'active_record'
require 'active_support'
require 'shoulda'

$:.unshift(File.dirname(__FILE__) + '/../lib')
RAILS_ROOT = File.dirname(__FILE__)

def log_to(stream)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.clear_active_connections!
end

log_to STDOUT

ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3", 
  :dbfile => ":memory:"
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