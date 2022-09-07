require "test_helper"

class Public::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_homes_top_url
    assert_response :success
  end

  test "should get new_guest" do
    get public_homes_new_guest_url
    assert_response :success
  end
end
