class CreateQiupins < ActiveRecord::Migration
  def change
    create_table :qiupins do |t|
      t.string :title
      t.text :body
      t.string :go_time
      t.string :dep_province
      t.string :dep_city
      t.string :dep_county
      t.string :dep_desc

      t.string :des_province
      t.string :des_city
      t.string :des_county
      t.string :des_desc

      t.references :user
      t.boolean :is_checked, :default => false
      t.string :tel
      t.string :contact
      t.timestamps
    end
      add_index :qiupins, :user_id
      add_index :qiupins, :is_checked
      add_index :qiupins, :dep_province
      add_index :qiupins, :dep_city
      add_index :qiupins, :dep_county
      add_index :qiupins, :des_province
      add_index :qiupins, :des_city
      add_index :qiupins, :des_county
  end
end
