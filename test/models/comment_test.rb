require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment= Comment.new(body: "That's such an interesting answer, you're so smart")
  end

  test "comment must have a user_id" do
    assert_not @comment.valid?
  end

  test "can create comments" do
    @comment.user_id = 2
    assert @comment.valid?
  end

  test "comments may belong to a question or answer and have upvotes" do
    @comment.user_id= 1
    @comment.question_id = 2
    @comment.answer_id = 1
    @comment.upvotes = 3
    assert @comment.valid?
  end

end
