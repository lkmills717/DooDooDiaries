class ChangeShapeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :shape, :string
  end
end
