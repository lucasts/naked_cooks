# coding: utf-8

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  
  end
  
  test "should be invalid" do
    comment = Comment.create
    assert !comment.valid?, "Comment shoudn't be created"
  end
  
  test "shouldn't accept nil body" do
    comment = create(:body => nil)
    assert comment.errors[:body].any?, ":body shoudn't be nil"
  end
  
  test "shouldn't accept short body value" do
    comment = create(:body => "ab")
    assert comment.errors[:body].any?, "short :body shoudn't be accept"
  end
  
  test "should create comment" do
    user = User.find_or_create_by_email(email:"hboaventura@gmai.com", password:"123456")
    recipe = user.recipes.create!(
      name: "Teste de receita",
      description: "Teste de descrição da receita"
    )
    comment = recipe.comments.new(
      body: 'Teste de comentário'
    )
    assert comment.save, "the comment should be created"
  end
  
  private
  
  def create(options={})
    Comment.create({
      :body   => "Body",
      :user   => User.new,
      :recipe => Recipe.new
    }.merge(options))
  end
  
end
