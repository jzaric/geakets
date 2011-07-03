class Geaket < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true

  belongs_to :user

  has_and_belongs_to_many :voters, :join_table => "votes", :class_name => "User", :uniq => true
  has_and_belongs_to_many :tags, :join_table => "geakets_tags", :class_name => "Tag", :uniq => true
end
