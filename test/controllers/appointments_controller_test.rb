require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointments_path
    assert_response :success
  end

  test "should get show" do
    appointment = appointments(:one)
    get appointment_path(appointment)
    assert_response :success
  end
end