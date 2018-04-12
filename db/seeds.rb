# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Contact.create!([first_name: "Ben", last_name: "Pohl", email: "pohl989@gmail.com", role: 3])
puts "Created Admin Account"

50.times {
  Contact.create!([
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    preferred_name: Faker::Name.first_name,
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

Client.create(
  # date_of_birth:
  # gender:
  # country_of_origin:
  # primary_language:
  # english_proficiency:
  # employed:
  # employment_type:
  # health_insurance:
  # medical_home:
  # primary_physician:
  # registered_to_vote:
  # household_size:
  # children_under_18:
  # household_income:
  )

10.times do
  Event.create!(
    title: Faker::App.name,
    date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    start_time: Faker::Time.between(2.days.ago, Date.today, :morning),
    end_time: Faker::Time.between(2.days.ago, Date.today, :evening),
    # length:
    # location_id:
    )
end

100.times do
  ContactEvent.create!(
    event_id: rand(1..Event.count),
    contact_id: rand(1..Contact.count),
    lead: false,
  )
end


puts "Added Events"
