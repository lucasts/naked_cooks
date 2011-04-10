class Recipe < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user
  
  has_one    :category  
  belongs_to :user
  
end
