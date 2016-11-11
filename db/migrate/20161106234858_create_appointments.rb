class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.date :initial_time
      t.date :final_time
      t.string :description
      t.integer :service_id
      t.integer :user_id

      t.timestamps
    end
  end
end
