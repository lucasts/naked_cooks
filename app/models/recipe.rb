class Recipe < ActiveRecord::Base
  
  before_create do |recipe|
    recipe.permalink = recipe.name.parameterize
  end
  
  validates_presence_of :name, :description, :user
  validates_length_of :name, :within => 3..150
  
  has_one    :category  
  has_many   :comments
  has_many   :favorites
  belongs_to :user
  
end
