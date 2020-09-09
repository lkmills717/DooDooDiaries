class AddDescriptionToBathrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :bathrooms, :description, :text
  end
end
