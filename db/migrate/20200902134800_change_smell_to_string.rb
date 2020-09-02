class ChangeSmellToString < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :smell, :string
  end
end
