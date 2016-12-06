class RemoveSheduleIdFromServices < ActiveRecord::Migration[5.0]
  def change
    remove_column :services, :schedule_id, :integer
  end
end
