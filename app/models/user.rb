class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :email, :password, :password_confirmation, :remember_me
  has_many :geakets

  validates :nickname, :presence => true, :length => { :maximum => 12 }

  has_and_belongs_to_many :votes, :class_name => "Geaket", :uniq => true, :join_table => "votes"
  #has_many :votes, :through => "votes", :source => :geaket, :uniq => true
end
