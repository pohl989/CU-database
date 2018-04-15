class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :contact_id
      t.integer :event_id
      t.boolean :lead

      t.timestamps
    end
  end
end
