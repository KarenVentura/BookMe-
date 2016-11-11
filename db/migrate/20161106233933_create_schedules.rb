class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.time :initial_time
      t.time :final_time
      t.integer :service_id

      t.timestamps
    end
  end
end
