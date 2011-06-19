class User < ActiveRecord::Base
  has_many :topics
  has_many :geakets

  has_and_belongs_to_many :votes, :class_name => "Geaket", :uniq => true, :join_table => "votes"
end
