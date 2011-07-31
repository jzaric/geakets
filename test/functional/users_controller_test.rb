require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get geakets" do
    get :geakets
    assert_response :success
  end

end
