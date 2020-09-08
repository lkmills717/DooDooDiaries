class AddStoolTypeToMovements < ActiveRecord::Migration[6.0]
  def change
    add_column :movements, :stool_type, :string
  end
end
