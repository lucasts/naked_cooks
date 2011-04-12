class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  
  # validates_presence_of   :first_name
  # validates_presence_of   :last_name
  # validates_presence_of   :password
  # validates_format_of     :email,
  #                         :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
  #                         :message    => 'email must be valid'
  # validates_uniqueness_of :email
  
  has_one :profile, :dependent => :destroy
  has_many :recipes
  has_many :comments  
  has_many :favorites  
  
end
