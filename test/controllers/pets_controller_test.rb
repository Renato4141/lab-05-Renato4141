require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pets_path
    assert_response :success
  end

  test "should get show" do
    pet = pets(:one)
    get pet_path(pet)
    assert_response :success
  end
end