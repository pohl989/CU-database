# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! ([
  email: "pohl989@gmail.com",
  password: "password",
  password_confirmation: "password" ,
  ])


Client.create! ([
  first_name: "laffy",
  # t.string :middle_name
  last_name: "taffy",
  # t.string :preferred_name
  # t.string :primary_phone
  # t.string :secondary_phone
  # t.boolean :text_messages
  # t.string :email
  # t.string :street_address
  # t.string :city
  # t.string :state
  # t.string :zip_code
  # t.date :date_of_birth
  # t.string :gender
  # t.string :country_of_origin
  # t.string :primary_language
  # t.string :english_proficiency
  # t.boolean :employed
  # t.string :employment_type
  # t.boolean :health_insurance
  # t.boolean :medical_home
  # t.boolean :primary_physician
  # t.boolean :registered_to_vote
  # t.integer :household_size
  # t.integer :children_under_18
  # t.string :household_income

  ])

  t.string :first_name
  t.string :middle_name
  t.string :last_name
  t.string :preferred_name
  t.string :primary_phone
  t.string :secondary_phone
  t.boolean :text_messages
  t.string :email
  t.string :street_address
  t.string :city
  t.string :state
  t.string :zip_code
  t.date :date_of_birth
  t.string :gender
  t.string :country_of_origin
  t.string :primary_language
  t.string :english_proficiency
  t.boolean :employed
  t.string :employment_type
  t.boolean :health_insurance
  t.boolean :medical_home
  t.boolean :primary_physician
  t.boolean :registered_to_vote
  t.integer :household_size
  t.integer :children_under_18
  t.string :household_income
