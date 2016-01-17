require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question= Question.new(title: "Why?", body: "because...", user_id: 1)
  end

  test "A valid question can be created" do
    assert @question.valid?
  end

end
