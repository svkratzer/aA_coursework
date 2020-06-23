class Edit2 < ActiveRecord::Migration[5.2]
  def change
      add_column :cat_rental_requests, :user_id, :integer, null: false, unique: true
      add_index :cat_rental_requests, :user_id, unique: true
  end
end