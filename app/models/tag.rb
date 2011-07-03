class Tag < ActiveRecord::Base
  has_and_belongs_to_many :geakets, :join_table => "geakets_tags", :class_name => "Geaket", :uniq => true
end
