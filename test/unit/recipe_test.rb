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
  
  test "should require user" do
    recipe = create(:user => nil)
    assert recipe.errors[:user].any?, ":user should be required"
  end
  
  test "should require a longer name" do
    recipe = create(:name => "a")
    assert !recipe.errors[:name].any?, "longer :name should be required"
  end
  
  test "should require a shorter name" do
    recipe = create(:name => "a"*155)
    assert recipe.errors[:name].any?, "shorter :name should be required"
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
