class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :stock_quantity
      t.decimal :price

      t.timestamps
    end
  end
end
