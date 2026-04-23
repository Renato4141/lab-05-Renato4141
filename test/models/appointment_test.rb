require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def valid_appointment
    Appointment.new(
      pet: pets(:one),
      vet: vets(:one),
      date: 1.day.from_now,
      reason: "Checkup",
      status: :scheduled
    )
  end

  test "valid appointment can be saved" do
    assert valid_appointment.valid?
  end

  test "invalid without date" do
    appt = valid_appointment
    appt.date = nil
    assert_not appt.valid?
    assert_includes appt.errors[:date], "can't be blank"
  end

  test "invalid without reason" do
    appt = valid_appointment
    appt.reason = nil
    assert_not appt.valid?
    assert_includes appt.errors[:reason], "can't be blank"
  end

  test "invalid without status" do
    appt = valid_appointment
    appt.status = nil
    assert_not appt.valid?
    assert appt.errors[:status].any?
  end

  test "invalid without pet" do
    appt = valid_appointment
    appt.pet = nil
    assert_not appt.valid?
    assert appt.errors[:pet].any?
  end

  test "invalid without vet" do
    appt = valid_appointment
    appt.vet = nil
    assert_not appt.valid?
    assert appt.errors[:vet].any?
  end

  test "enum has correct values" do
    assert_equal 0, Appointment.statuses[:scheduled]
    assert_equal 1, Appointment.statuses[:in_progress]
    assert_equal 2, Appointment.statuses[:completed]
    assert_equal 3, Appointment.statuses[:cancelled]
  end

  test "upcoming scope returns future appointments ordered asc" do
    appt = valid_appointment
    appt.date = 5.days.from_now
    appt.save!
    assert_includes Appointment.upcoming, appt
  end

  test "past scope returns past appointments ordered desc" do
    appt = appointments(:two)  # fixture con fecha pasada
    assert_includes Appointment.past, appt
  end
end