class Recipe < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user
  
  has_one    :category  
  has_many   :comments
  has_many   :favorites
  belongs_to :user
  
end
