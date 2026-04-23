require "test_helper"

class PetTest < ActiveSupport::TestCase
  def valid_pet
    Pet.new(
      name: "Fido",
      species: "dog",
      breed: "Labrador",
      date_of_birth: 2.years.ago.to_date,
      weight: 20.0,
      owner: owners(:one)
    )
  end

  test "valid pet can be saved" do
    assert valid_pet.valid?
  end

  test "invalid without name" do
    pet = valid_pet
    pet.name = nil
    assert_not pet.valid?
    assert_includes pet.errors[:name], "can't be blank"
  end

  test "invalid without species" do
    pet = valid_pet
    pet.species = nil
    assert_not pet.valid?
    assert_includes pet.errors[:species], "can't be blank"
  end

  test "invalid with unrecognized species" do
    pet = valid_pet
    pet.species = "dragon"
    assert_not pet.valid?
    assert pet.errors[:species].any?
  end

  test "valid with all accepted species" do
    %w[dog cat rabbit bird reptile other].each do |sp|
      pet = valid_pet
      pet.species = sp
      assert pet.valid?, "Expected #{sp} to be valid"
    end
  end

  test "invalid without date_of_birth" do
    pet = valid_pet
    pet.date_of_birth = nil
    assert_not pet.valid?
    assert_includes pet.errors[:date_of_birth], "can't be blank"
  end

  test "invalid with future date_of_birth" do
    pet = valid_pet
    pet.date_of_birth = 1.day.from_now.to_date
    assert_not pet.valid?
    assert pet.errors[:date_of_birth].any?
  end

  test "invalid without weight" do
    pet = valid_pet
    pet.weight = nil
    assert_not pet.valid?
    assert_includes pet.errors[:weight], "can't be blank"
  end

  test "invalid with weight zero or negative" do
    pet = valid_pet
    pet.weight = 0
    assert_not pet.valid?
    assert pet.errors[:weight].any?

    pet.weight = -1
    assert_not pet.valid?
  end

  test "invalid without owner" do
    pet = valid_pet
    pet.owner = nil
    assert_not pet.valid?
    assert pet.errors[:owner].any?
  end

  test "name is capitalized before saving" do
    pet = valid_pet
    pet.name = "fido"
    pet.valid?
    assert_equal "Fido", pet.name
  end
end