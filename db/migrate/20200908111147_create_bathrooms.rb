class CreateBathrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :bathrooms do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
