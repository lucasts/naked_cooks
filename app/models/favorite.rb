class Favorite < ActiveRecord::Base

  validates :user, :recipe, :presence => true
  validate :users_cant_be_equal

  belongs_to :user
  belongs_to :recipe
  
  def users_cant_be_equal
    if !user.nil? and !recipe.nil?
      errors.add(:user, "User can't favorite his own recipe") unless user != recipe.user
    end
    
  end
  
end
