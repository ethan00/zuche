class CreatePinches < ActiveRecord::Migration
  def change
    create_table :pinches do |t|
      t.string :title
      t.string :go_time
      t.text :body
      t.string :way
      t.string :car_info
      t.string :car_level
      t.boolean :is_checked, :default => false
      t.string :contact
      t.string :tel
      t.string :dep_province
      t.string :dep_city
      t.string :dep_county
      t.string :dep_desc

      t.string :des_province
      t.string :des_city
      t.string :des_county
      t.string :des_desc

      t.integer :person
      t.references :user
      t.timestamps
    end
    add_index :pinches, :user_id
    add_index :pinches, :is_checked
    add_index :pinches, :car_info
    add_index :pinches, :car_level
    add_index :pinches, :dep_province
    add_index :pinches, :dep_city
    add_index :pinches, :dep_county
    add_index :pinches, :des_province
    add_index :pinches, :des_city
    add_index :pinches, :des_county
  end
end
