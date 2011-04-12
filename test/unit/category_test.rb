require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    category = Category.create
    assert !category.valid?, "User shoudn't be created"
  end
  
  test "should not accept equal category" do
    category1 = Category.create!(name:'fish')
    category2 = Category.create(name:'fish')
    assert !category2.save, "Category with same name shound't be created"
  end
  
end
