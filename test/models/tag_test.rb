require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = Tag.new(question_id: 1, category: "kelp")
  end

  test "A tag can be created" do
    assert @tag.valid?
  end
end
