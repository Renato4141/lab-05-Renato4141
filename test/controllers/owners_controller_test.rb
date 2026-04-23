require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owners_path
    assert_response :success
  end

  test "should get show" do
    owner = owners(:one)
    get owner_path(owner)
    assert_response :success
  end
end
