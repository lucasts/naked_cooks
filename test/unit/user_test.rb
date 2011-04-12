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
    user1 = create(email:'hboaventura@gmail.com', password:'donald')
    user1.save
    
    user2 = create(email:'hboaventura@gmail.com', password:'donald')
    assert !user2.save, "User with same e-mail shound't be created"
  end
  
  test "should not accept invalid email" do
    user = create(:email => 'teste')
    
    assert user.errors[:email].any?, "invalid :email shouldn't be accepted"    
  end
  
  test "should not accept empty password" do
    user = create(:password => nil)
    
    assert user.errors[:password].any?, "nil :password shouldn't be accepted"    
  end
  
  test "should not accept short password" do
    user = create(:password => "abcde")
    
    assert user.errors[:password].any?, "short :password shouldn't be accepted"    
  end
  
  private
  
  def create(options={})
    User.create({
      :email    => "email@test.com",
      :password => "password",
    }.merge(options))
  end
  
end
