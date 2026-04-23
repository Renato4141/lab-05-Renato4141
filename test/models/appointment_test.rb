test "appointment is valid with all required attributes" do
  appointment = Appointment.new(
    pet: pets(:one),
    vet: vets(:one),
    date: Time.current + 1.day,
    reason: "General checkup",
    status: :scheduled
  )

  assert appointment.valid?
end