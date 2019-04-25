# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
City.destroy_all
Doctor.destroy_all
Specialty.destroy_all
JoinTableSpecialtyDoctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

#Creation des villes 
100.times do
City.create(name: Faker::Address.city)
end


 20.times do
    Doctor.create(first_name: Faker::Movies::StarWars.character, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city:City.all.sample)
end

20.times do

    Specialty.create(name: Faker::Restaurant.type )
end

20.times do

    JoinTableSpecialtyDoctor.create(doctor_id: Doctor.all.sample, specialty_id: Specialty.all.sample)
end

20.times do

    Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
end


20.times do

 Appointment.create(date: Faker::Date.forward(60), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample)
end

