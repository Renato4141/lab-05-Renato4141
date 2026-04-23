require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  def valid_owner
    Owner.new(
      first_name: "Ana",
      last_name: "García",
      email: "ana@example.com",
      phone: "123456789"
    )
  end

  test "valid owner can be saved" do
    assert valid_owner.valid?
  end

  test "invalid without first_name" do
    owner = valid_owner
    owner.first_name = nil
    assert_not owner.valid?
    assert_includes owner.errors[:first_name], "can't be blank"
  end

  test "invalid without last_name" do
    owner = valid_owner
    owner.last_name = nil
    assert_not owner.valid?
    assert_includes owner.errors[:last_name], "can't be blank"
  end

  test "invalid without email" do
    owner = valid_owner
    owner.email = nil
    assert_not owner.valid?
    assert_includes owner.errors[:email], "can't be blank"
  end

  test "invalid with bad email format" do
    owner = valid_owner
    owner.email = "not-an-email"
    assert_not owner.valid?
    assert owner.errors[:email].any?
  end

  test "invalid with duplicate email" do
    owners(:one)  # carga el fixture para que ocupe ese email
    owner = valid_owner
    owner.email = owners(:one).email
    assert_not owner.valid?
    assert_includes owner.errors[:email], "has already been taken"
  end

  test "invalid without phone" do
    owner = valid_owner
    owner.phone = nil
    assert_not owner.valid?
    assert_includes owner.errors[:phone], "can't be blank"
  end

  test "email is normalized to lowercase before validation" do
    owner = valid_owner
    owner.email = "  ANA@EXAMPLE.COM  "
    owner.valid?
    assert_equal "ana@example.com", owner.email
  end
end