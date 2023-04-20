class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :event_object_id
      t.string :event_object_type
      t.json :event_data
      t.string :event_name

      t.timestamps
    end

    add_index :events, :event_object_id
  end
end
