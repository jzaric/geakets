class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :geakets

  has_and_belongs_to_many :votes, :class_name => "Geaket", :uniq => true, :join_table => "votes"
  #has_many :votes, :through => "votes", :source => :geaket, :uniq => true
end
