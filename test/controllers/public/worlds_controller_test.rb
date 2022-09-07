require "test_helper"

class Public::WorldsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_worlds_index_url
    assert_response :success
  end

  test "should get show" do
    get public_worlds_show_url
    assert_response :success
  end
end
