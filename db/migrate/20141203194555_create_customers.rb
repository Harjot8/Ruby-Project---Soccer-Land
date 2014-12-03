class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :username
      t.string :first
      t.string :last
      t.string :email
      t.string :image
      t.string :bio

      t.timestamps
    end
  end
end
