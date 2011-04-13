class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user_id, :presence => true
  validates :recipe_id, :presence => true
  
  validate :users_cant_be_equal
  
  def users_cant_be_equal
    errors.add(:user, "User can't favorite his own recipe") unless user != recipe.user
  end
  
end
