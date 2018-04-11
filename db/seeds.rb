# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

50.times {
  Contact.create!([
    first_name: "Benjamin",
    middle_name: "Jacob",
    last_name: "Pohl",
    preferred_name: "Ben",
    primary_phone: Faker::PhoneNumber.phone_number,
    secondary_phone: Faker::PhoneNumber.phone_number,
    text_messages: Faker::Boolean.boolean(0.8),
    email: Faker::Internet.email,
    street_address: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip_code: Faker::Address.zip_code,
  ])
}

puts "Added Contacts"
Contact.all.each do |c|
  User.create!(
    email: c.email,
    password: "password",
    password_confirmation: "password" ,
    contact_id: c.id,
    )
end
puts "Added Users"

# Client.create(
#   # date_of_birth:
#   # gender:
#   # country_of_origin:
#   # primary_language:
#   # english_proficiency:
#   # employed:
#   # employment_type:
#   # health_insurance:
#   # medical_home:
#   # primary_physician:
#   # registered_to_vote:
#   # household_size:
#   # children_under_18:
#   # household_income:
#   )
#
#   Event.create!(
#     title:
#     date:
#     start_time:
#     end_time:
#     length:
#     location_id:
#     )
