class ChangeDataTypeForString < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :feeling, :string
  end
end
