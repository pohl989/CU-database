class CreateContactEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_events do |t|
      t.integer :contact_id
      t.integer :event_id
      t.boolean :lead

      t.timestamps
    end
  end
end
