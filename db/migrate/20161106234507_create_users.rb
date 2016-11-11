class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :telephone
      t.string :cellphone

      t.timestamps
    end
  end
end
