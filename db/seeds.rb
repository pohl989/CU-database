# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Let the seeding begin!"

User.create! ([
  email: "pohl989@gmail.com",
  password: "password",
  password_confirmation: "password"])

puts "Added Ben's account"
# emails = ["pohl989@gmail.com", "luis@cuutah.org"]
# emails.each do |email|
#   user = User.new(email: email, password: "password", password_confirmation: "password", role: :admin, verified: true)
#   puts "Setting up user, contact record for : #{user}.email"
#   user.save
# end
# puts "Added Admin Users"
#

#adding variables
primary_language = ["English", "Spanish", "English and Spanish", "Other"]
country = ["United States", "Mexico", "Peru", "Cuba", "Spain", "Chile", "Panama", "Germany"]
english_proficiency = ["Low", "Intermediate", "High"]
gender = ["Male", "Female", "Other"]
employment_status = ["Employed", "Unemployed"]
employment_type = ["Employed for Wages", "Self Employed", "Out of Work and looking", "Out of Work and NOT looking", "Homemaker", "Student", "Military", "Retired", "Unable to Work"]
medical_home_location = ["Community Clinic", "Mobile Clinic", "University of Utah", "Intermountian", "Private Clinic"]
household_income = ["Less than $10,000", "$10,000 to $20,000", "$20,000 to $30,000", "$30,000 to $40,000", "more than $40,000"]

100.times do
  Profile.create! ([
    first_name: Faker::StarTrek.character,
    middle_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    preferred_name: Faker::Name.first_name,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code,
    primary_phone: Faker::Base.numerify('(###) ###-####'),
    alternate_phone: Faker::Base.numerify('(###) ###-####'),
    personal_email: Faker::Internet.email,
    work_email: Faker::Internet.email,
    gender: gender,
    country_of_origin: country.sample,
    primary_language: primary_language.sample,
    english_proficiency: english_proficiency,
    employment_status: employment_status.sample,
    employment_type: employment_type.sample,
    discriminated_at_work: Faker::Boolean.boolean(0.2),
    health_insurance: Faker::Boolean.boolean(0.8),
    medical_home: Faker::Boolean.boolean(0.6),
    medical_home_location: medical_home_location,
    primary_physician: Faker::Boolean.boolean(0.8),
    household_size: Faker::Number.between(1, 10),
    children_under_18: Faker::Number.between(1, 8),
    household_income: household_income,
    registered_to_vote: Faker::Boolean.boolean(0.6),
    date_of_birth: Faker::Date.birthday(18, 65),
    text_messages: Faker::Boolean.boolean(0.8),
    ])
end

puts "Added Profiles"
