# coding: utf-8
require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    favorite = Favorite.create
    assert !favorite.valid?, "Favorite shoudn't be created"
  end
  
  test "nil user shouldn't be accept" do
    favorite = create(:user => nil)
    assert favorite.errors[:user].any?, "nil :user shoudn't be accept"
  end
  
  test "nil recipe shouldn't be accept" do
    favorite = create(:recipe => nil)
    assert favorite.errors[:recipe].any?, "nil :recipe shoudn't be accept"
  end
  
  test "should favorite recipe" do
    user_recipe = User.find_or_create_by_email(email:"hboaventura@gmail.com", password:"123456")
    recipe = user_recipe.recipes.create!(
      name: "Teste de receita",
      description: "Teste de descrição da receita"
    )
    user_favorite = User.find_or_create_by_email(email:"hboaventura@muggyhill.com", password:"123456")
    favorite = user_favorite.favorites.new(recipe:recipe)
    
    assert favorite.save, "recipe should be created"
  end
  
  test "should not favorite self recipe" do
    user = User.find_or_create_by_email(email:"hboaventura@gmai.com", password:"123456")
    recipe = user.recipes.create!(
      name: "Teste de receita",
      description: "Teste de descrição da receita"
    )
    favorite = user.favorites.new(recipe:recipe)
    assert !favorite.save, "self recipe shouldn't be accept"
  end
  
  private
  
  def create(options={})
    Favorite.create({
      :user   => User.new,
      :recipe => Recipe.new
    }.merge(options))
  end
  
end
