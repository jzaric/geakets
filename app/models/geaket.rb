class Geaket < ActiveRecord::Base
  attr_accessor :tag_list

  validates :title, :presence => true, :length => { :maximum => 32 }
  validates :content, :presence => true, :length => { :maximum => 255 }

  belongs_to :user
  
  has_many :children, :class_name => "Geaket", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Geaket", :foreign_key => "parent_id"

  has_and_belongs_to_many :voters, :join_table => "votes", :class_name => "User", :uniq => true
  has_and_belongs_to_many :tags, :join_table => "geakets_tags", :class_name => "Tag", :uniq => true

  after_create :insert_tags

  def insert_tags
    self.tag_list.split(",").each do |tmp|
      tmp.strip!
      tag = Tag.find_by_name(tmp)
      if tag.nil?
        self.tags.create(:name => tmp)
      else
        self.tags<<(tag)
      end
    end
  end
end
