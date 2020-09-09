class AddNameToBathrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :bathrooms, :name, :string
  end
end
