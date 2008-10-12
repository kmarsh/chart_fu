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
  :dbfile => "db/test.sqlite3"
})

ActiveRecord::Migrator.migrate("db/migrate/")

class Post < ActiveRecord::Base
  def self.setup
    if Post.count != 120
      puts "Creating Posts..."
      Post.delete_all
      (0..60).each do |day|
        (day % 5).times do
          Post.create(:created_at => day.days.ago, :updated_at => day.days.ago)
        end
      end
    end
  end
end

Post.setup

require 'chart_fu'
Object.send :include, ChartFu::Mixin