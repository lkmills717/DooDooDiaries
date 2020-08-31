class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements do |t|
      t.integer :feeling
      t.integer :effort
      t.integer :duration
      t.integer :type
      t.integer :color
      t.integer :smell
      t.text :comments

      t.timestamps
    end
  end
end
