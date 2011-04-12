require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    category = Category.create
    assert !category.valid?, "Category shoudn't be created"
  end
  
  test "shouldn't accept existing category" do
    category1 = create(:name => 'teste').save
    category2 = create(:name => 'teste')
    
    assert !category2.save, "existing :name shoudn't be accepted"
  end
  
  test "shouldn't accept short category name" do
    category = create(:name => 'abc')
    
    assert category.errors[:name].any?, "short :name shoudn't be accepted"
  end
  
  private
  
  def create(options={})
    Category.create({
      :name     => "Name"
    }.merge(options))
  end
  
end
