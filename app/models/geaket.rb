class Geaket < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true

  belongs_to :user

  has_and_belongs_to_many :voters, :class_name => "User", :uniq => true, :join_table => "votes"
  has_and_belongs_to_many :tags, :class_name => "Tag", :uniq => true, :join_table => "geakets_tags"
end
