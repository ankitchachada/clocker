class CreateClockEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :clock_events do |t|
      t.integer :user_id
      t.boolean :is_clocked
      t.string :event_type

      t.timestamps
    end
  end
end
