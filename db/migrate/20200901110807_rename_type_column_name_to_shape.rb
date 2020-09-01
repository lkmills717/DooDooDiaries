class RenameTypeColumnNameToShape < ActiveRecord::Migration[6.0]
  def change
    rename_column :movements, :type, :shape
  end
end
