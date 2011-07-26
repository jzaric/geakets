class Geaket < ActiveRecord::Base
  attr_accessor :tag_list

  validates :title, :presence => true, :length => { :maximum => 64 }
  validates :content, :presence => true, :length => { :maximum => 255 }

  belongs_to :user
  
  has_many :children, :class_name => "Geaket", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Geaket", :foreign_key => "parent_id"

  has_and_belongs_to_many :voters, :join_table => "votes", :class_name => "User", :uniq => true
  has_and_belongs_to_many :tags, :join_table => "geakets_tags", :class_name => "Tag", :uniq => true

  after_create :insert_tags

  def insert_tags
    unless self.tag_list.nil?
      self.tag_list.split(',').each do |tag_item|
        tag_item.strip!
        tag_item.split(' ').each do |word|
          word.strip!
          unless word.empty?
            tag = Tag.find_by_name(word)
            if tag.nil?
              self.tags.create(:name => word)
            else
              self.tags<<(tag)
            end
          end
        end
      end
    end
  end
end
