ActiveRecord::Schema.define :version => 0 do # include table descriptions using migration syntax

  # Posts
  create_table "posts", :force => true do |t|
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end
  
  puts "Creating Posts..."
  Post.delete_all
  
  # Over the past 60 days, create up to 5 posts per day
  (0..60).each do |day|
    (day % 5).times do
      Post.create(:created_at => day.days.ago, :updated_at => day.days.ago)
    end
  end
  
  # Users
  create_table "users", :force => true do |t|
    t.column "name", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end
  
  puts "Creating Users..."
  User.delete_all
  
  # Over the last year, create between 0-10 users per day
  (0..365).each do |day|
    rand(10).times do
      User.create(:name => "User ##{Time.now.to_f}", :created_at => day.days.ago, :updated_at => day.days.ago)
    end
  end  

end
  