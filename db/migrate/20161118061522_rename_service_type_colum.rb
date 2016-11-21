class RenameServiceTypeColum < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :services, :type, :specialty
  end

  def self.down
    rename_column :services, :specialty, :type
  end
end
