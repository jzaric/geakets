require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    100.times do |n|
      nick_name = Faker::Name.name
      email = "example-#{n+1}@example.org"
      User.create!(:nick_name => nick_name,
        :email => email,
        :thumb_url => "http://static.ak.fbcdn.net/rsrc.php/v1/yp/r/kk8dc2UJYJ4.png")
    end

    User.find(1).topics.create!(:title => "test", :active => true)
    100.times do |n|
      User.find(n+1).geakets.create!(:topic_id => 1, :title => Faker::Lorem.sentence(1), :content => Faker::Lorem.sentence(2))
    end

    100.times do |n|
      User.find(n+1).votes<<(Geaket.find(n+1))
    end
  end
end