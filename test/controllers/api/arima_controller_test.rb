require 'test_helper'

class Api::ArimaControllerTest < ActionController::TestCase
  test "should get get_prediction_data" do
    get :get_prediction_data
    assert_response :success
  end

end
