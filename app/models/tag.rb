class Tag < ActiveRecord::Base
  has_and_belongs_to_many :geakets, :class_name => "Geaket", :uniq => true, :join_table => "geakets_tags"
end
