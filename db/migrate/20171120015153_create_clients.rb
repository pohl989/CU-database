class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
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

      t.timestamps
    end
  end
end
