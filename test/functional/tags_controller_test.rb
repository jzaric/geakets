require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "should get geakets" do
    get :geakets
    assert_response :success
  end

end
