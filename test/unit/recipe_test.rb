# coding: utf-8
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    recipe = Recipe.create
    assert !recipe.valid?, "Recipe shoudn't be created"
  end
  
  test "should require name" do
    recipe = create(:name => nil)
    assert recipe.errors[:name].any?, ":name should be required"
  end
  
  test "should require description" do
    recipe = create(:description => nil)
    assert recipe.errors[:description].any?, ":description should be required"
  end
  
  test "should require a longer description" do
    recipe = create(:description => 'abc')
    assert recipe.errors[:description].any?, "a longer :description should be required"
  end
  
  test "should require user" do
    recipe = create(:user => nil)
    assert recipe.errors[:user].any?, ":user should be required"
  end
  
  test "should require a longer name" do
    recipe = create(:name => "a")
    assert recipe.errors[:name].any?, "longer :name should be required"
  end
  
  test "should require a shorter name" do
    recipe = create(:name => "a"*155)
    assert recipe.errors[:name].any?, "shorter :name should be required"
  end
  
  test "should create a recipe" do
    user = User.find_or_create_by_email(email:'hboaventura@gmail.com', password:'123456')
    recipe = user.recipes.new(
      name:"Teste de receita",
      description:"descricão da receita"
    )
    
    assert recipe.save, "the recipe should be created"    
  end
  
  private
  
  def create(options={})
    Recipe.create({
      :name        => "Name",
      :image       => "Image",
      :description => "Description",
      :user        => User.new
    }.merge(options))
  end
  
end
