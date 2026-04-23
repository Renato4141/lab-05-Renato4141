require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  def valid_treatment
    Treatment.new(
      name: "Antibiotic",
      administered_at: Time.current,
      appointment: appointments(:one)
    )
  end

  test "valid treatment can be saved" do
    assert valid_treatment.valid?
  end

  test "invalid without name" do
    treatment = valid_treatment
    treatment.name = nil
    assert_not treatment.valid?
    assert_includes treatment.errors[:name], "can't be blank"
  end

  test "invalid without administered_at" do
    treatment = valid_treatment
    treatment.administered_at = nil
    assert_not treatment.valid?
    assert_includes treatment.errors[:administered_at], "can't be blank"
  end

  test "invalid without appointment" do
    treatment = valid_treatment
    treatment.appointment = nil
    assert_not treatment.valid?
    assert treatment.errors[:appointment].any?
  end
end