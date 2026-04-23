require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vets_path
    assert_response :success
  end

  test "should get show" do
    vet = vets(:one)
    get vet_path(vet)
    assert_response :success
  end
end