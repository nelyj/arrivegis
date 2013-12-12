require 'test_helper'

class DirectionsControllerTest < ActionController::TestCase
  test "should get custom" do
    get :custom
    assert_response :success
  end

end
