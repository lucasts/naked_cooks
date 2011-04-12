class Recipe < ActiveRecord::Base
  
  before_create do |recipe|
    recipe.permalink = recipe.name.parameterize
  end
  
  validates :name, :presence => true, :length => { :within => 3..150 }
  validates :description, :presence =>true, :length => { :minimum => 4 }
  validates_presence_of :user
  
  has_one    :category  
  has_many   :comments
  has_many   :favorites
  belongs_to :user
  
end
