require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have a create route" do
    assert_difference('User.count') do
    post( :create, {name: "eel grass", email: 'sea.com'})
    end

  end
end
