class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :type_of_cuisine
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
