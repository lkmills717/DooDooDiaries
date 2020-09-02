class ChangeEffortToString < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :effort, :string
  end
end
