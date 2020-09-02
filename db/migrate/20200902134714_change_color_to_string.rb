class ChangeColorToString < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :color, :string
  end
end
