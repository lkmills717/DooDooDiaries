class AddBathroomToMovements < ActiveRecord::Migration[6.0]
  def change
    add_reference :movements, :bathroom, null: false, foreign_key: true
  end
end
