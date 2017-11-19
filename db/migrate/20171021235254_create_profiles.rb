class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :primary_phone
      t.string :alternate_phone
      t.string :personal_email
      t.string :work_email
      t.string :preferred_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :gender
      t.string :country_of_origin
      t.string :primary_language
      t.string :english_proficiency
      t.string :employment_status
      t.string :employment_type
      t.boolean :discriminated_at_work
      t.boolean :health_insurance
      t.boolean :medical_home
      t.string :medical_home_location
      t.boolean :primary_physician
      t.integer :household_size
      t.integer :children_under_18
      t.string :household_income
      t.boolean :registered_to_vote
      t.date :date_of_birth
      t.boolean :text_messages


      t.timestamps
    end
  end
end
