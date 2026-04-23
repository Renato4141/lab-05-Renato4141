# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Limpiar datos
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Owner.destroy_all
Vet.destroy_all

# Owners
owner1 = Owner.create(first_name: "Juan Carlos", last_name: "Bodoque", email: "bancodetitirilquen@gmail.com", phone: "458674", address: "Titirilkquen 4")
owner2 = Owner.create(first_name: "Juanin Juan", last_name: "Harry", email: "juaninjh@gmail.com", phone: "654321", address: "Isla de Cachirula")
owner3 = Owner.create(first_name: "Mario", last_name: "Hugo", email: "mhugo@gmail.com", phone: "987654", address: "esquina de Ministro Carvajal con Ministro Carvajal")

# Pets (usando asociaciones)
pet1 = owner1.pets.create(name: "Estalagtimitiquita", species: "Dog", breed: "Labrador", date_of_birth: "2020-01-01", weight: 25.5)
pet2 = owner1.pets.create(name: "Carambolas", species: "Cat", breed: "Siamese", date_of_birth: "2020-05-10", weight: 5.2)
pet3 = owner2.pets.create(name: "Barney", species: "Rabbit", breed: "Mini Lop", date_of_birth: "2020-03-15", weight: 2.1)
pet4 = owner3.pets.create(name: "Gonzo", species: "Dog", breed: "Bulldog", date_of_birth: "2020-07-20", weight: 20.0)
pet5 = owner2.pets.create(name: "Lunares", species: "Cat", breed: "Persian", date_of_birth: "2020-11-11", weight: 4.8)

# Vets
vet1 = Vet.create(first_name: "Anabela", last_name: "Silvanus", email: "anabela@vet.com", phone: "111111", specialization: "General")
vet2 = Vet.create(first_name: "Cabro", last_name: "Cabreras", email: "cabracobra@vet.com", phone: "222222", specialization: "Surgery")

# Appointments (status: 0=schedule,1=progress,2=completed,3=cancelled)
app1 = Appointment.create(pet: pet1, vet: vet1, date: 3.days.from_now, reason: "Checkup", status: 0)
app2 = Appointment.create(pet: pet2, vet: vet1, date: 1.day.from_now, reason: "Vaccination", status: 1)
app3 = Appointment.create(pet: pet3, vet: vet2, date: 2.days.ago, reason: "Injury", status: 2)
app4 = Appointment.create(pet: pet4, vet: vet2, date: 5.days.ago, reason: "Surgery", status: 2)
app5 = Appointment.create(pet: pet5, vet: vet1, date: 1.day.ago, reason: "Skin issue", status: 3)

# Treatments (solo en progreso o completados)
Treatment.create(appointment: app2, name: "Antibiotic", medication: "Amoxicillin", dosage: "2x daily", notes: "Infection", administered_at: Time.now)
Treatment.create(appointment: app3, name: "Pain relief", medication: "Ibuprofen", dosage: "1x daily", notes: "Post injury", administered_at: Time.now)
Treatment.create(appointment: app4, name: "Post surgery", medication: "Antibiotics", dosage: "3x daily", notes: "Recovery", administered_at: Time.now)
Treatment.create(appointment: app2, name: "Vitamin", medication: "Vit C", dosage: "1x daily", notes: "Immune boost", administered_at: Time.now)
Treatment.create(appointment: app3, name: "Bandage", medication: "None", dosage: "N/A", notes: "Wound care", administered_at: Time.now)
