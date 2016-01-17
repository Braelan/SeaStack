require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
#answers have to have a body and a question id

  def setup
    @answer = Answer.new( question_id: 2)
  end

  test "an answer must have a body" do
    assert_not @answer.valid?
  end

  test "can create a valid answer" do
    @answer.body = "I wish I were an Oscar Meyer Wiener"
    assert @answer.valid?
  end

end
