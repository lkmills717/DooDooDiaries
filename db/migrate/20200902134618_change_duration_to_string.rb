class ChangeDurationToString < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :duration, :string
  end
end
