require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "should be invalid" do
    user = User.create
    assert !user.valid?, "User shoudn't be created"
  end
  
  test "should not accept equal user" do
    user1 = User.create(email:'hboaventura@gmail.com', password:'donald')
    user2 = User.create(email:'hboaventura@gmail.com', password:'donald')
    assert !user2.save, "User with same e-mail shound't be created"
  end
  
end
