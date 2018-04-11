class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :preferred_name
      t.string :email
      t.string :primary_phone
      t.string :secondary_phone
      t.boolean :text_messages
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
