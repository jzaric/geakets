class Geaket < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true

  belongs_to :topic
  belongs_to :user
end
