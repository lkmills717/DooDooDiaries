class ChangeBathroomReferenceInMovements < ActiveRecord::Migration[6.0]
  def change
    change_column_null :movements, :bathroom_id, true
  end
end
