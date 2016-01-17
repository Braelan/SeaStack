require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example", email: "example@example.com", password_digest: "asdf")
  end

  test "should be a valid user" do
    assert @user.valid?
  end

  test "can't have a null email" do
    @user.email = nil
    assert_not @user.valid?
  end

end
