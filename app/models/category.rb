class Category < ActiveRecord::Base
  
  before_create do |category|
    category.permalink = category.name.parameterize
  end
  
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 4 }
  
  has_many :recipes
end
