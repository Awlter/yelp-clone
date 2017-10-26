class AddSluggable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slug, :string
    add_column :businesses, :slug, :string
  end
end
