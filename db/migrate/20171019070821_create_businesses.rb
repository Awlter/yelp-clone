class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
