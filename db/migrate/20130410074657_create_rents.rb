class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.string :title
      t.text :body
      t.string :style
      t.string :tel
      t.string :contact
      t.integer :price
      t.string :car_info
      t.string :departure
      t.boolean :is_checked, :default => false
      t.references :user
      t.timestamps
    end
    add_index :rents, :user_id
    add_index :rents, :is_checked
  end
end
