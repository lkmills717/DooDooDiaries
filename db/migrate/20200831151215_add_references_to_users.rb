class AddReferencesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :meal, null: false, foreign_key: true
    add_reference :users, :movement, null: false, foreign_key: true
  end
end
