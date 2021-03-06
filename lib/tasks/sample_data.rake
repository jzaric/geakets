#require 'faker'
#
#namespace :db do
#  desc "Fill database with sample data"
#  task :populate => :environment do
#    Rake::Task['db:reset'].invoke
#    100.times do |n|
#      nick_name = Faker::Name.name
#      email = "example-#{n+1}@example.org"
#      User.create!(:nick_name => nick_name,
#        :email => email,
#        :thumb_url => "http://static.ak.fbcdn.net/rsrc.php/v1/yp/r/kk8dc2UJYJ4.png")
#    end
#
#    100.times do |n|
#      User.find(n+1).geakets.create!(:title => "#{Faker::Lorem.words(1)}", :content => Faker::Lorem.sentence(2), :tag_list => "#{Faker::Lorem.words(1)},#{Faker::Lorem.words(1)}", :view_count => n)
#    end
#
#    100.times do |n|
#      User.find(n+1).votes<<(Geaket.find(n+1))
#    end
#
##    100.times do |n|
##      tag = Tag.create!(:name => "#{Faker::Lorem.words(1)}_#{n + 1}")
##      Geaket.find(n+1).tags<<(tag);
##      if n > 50
##        Geaket.find(n).tags<<(tag);
##      end
##      if n > 75
##        Geaket.find(n-1).tags<<(tag);
##      end
##    end
#
#    10.times do |n|
#      @g = Geaket.find(n+2)
#      @g.parent = Geaket.find(n+1)
#      @g.save
#    end
#
#    @g1 = Geaket.find(100)
#    10.times do |n|
#      @g1.children<<(Geaket.find(n+50))
#    end
#    #@g1.save
#
#  end
#end