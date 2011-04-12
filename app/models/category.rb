class Category < ActiveRecord::Base
  
  before_create do |category|
    category.permalink = category.name.parameterize
  end
  
  validates_presence_of   :name
  validates_uniqueness_of :name
  
  has_many :recipes
end
