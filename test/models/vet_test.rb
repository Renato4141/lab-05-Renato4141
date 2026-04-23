require "test_helper"

class VetTest < ActiveSupport::TestCase
  def valid_vet
    Vet.new(
      first_name: "Carlos",
      last_name: "Soto",
      email: "carlos@vet.com",
      specialization: "General"
    )
  end

  test "valid vet can be saved" do
    assert valid_vet.valid?
  end

  test "invalid without first_name" do
    vet = valid_vet
    vet.first_name = nil
    assert_not vet.valid?
    assert_includes vet.errors[:first_name], "can't be blank"
  end

  test "invalid without last_name" do
    vet = valid_vet
    vet.last_name = nil
    assert_not vet.valid?
    assert_includes vet.errors[:last_name], "can't be blank"
  end

  test "invalid without email" do
    vet = valid_vet
    vet.email = nil
    assert_not vet.valid?
    assert_includes vet.errors[:email], "can't be blank"
  end

  test "invalid with bad email format" do
    vet = valid_vet
    vet.email = "not-an-email"
    assert_not vet.valid?
    assert vet.errors[:email].any?
  end

  test "invalid with duplicate email" do
    vets(:one)
    vet = valid_vet
    vet.email = vets(:one).email
    assert_not vet.valid?
    assert_includes vet.errors[:email], "has already been taken"
  end

  test "invalid without specialization" do
    vet = valid_vet
    vet.specialization = nil
    assert_not vet.valid?
    assert_includes vet.errors[:specialization], "can't be blank"
  end

  test "email is normalized to lowercase before validation" do
    vet = valid_vet
    vet.email = "  CARLOS@VET.COM  "
    vet.valid?
    assert_equal "carlos@vet.com", vet.email
  end
end