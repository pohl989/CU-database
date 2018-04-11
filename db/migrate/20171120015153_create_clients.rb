class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
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
