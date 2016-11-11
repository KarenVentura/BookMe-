class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :week_days
      t.string :type
      t.integer :category_id
      t.integer :user_id
      t.string :schedule_id

      t.timestamps
    end
  end
end
