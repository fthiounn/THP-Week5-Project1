require 'test_helper'

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dynamic_pages_home_url
    assert_response :success
  end

end
