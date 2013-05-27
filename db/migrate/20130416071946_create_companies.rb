class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.text :body
      t.string :link
      t.boolean :advan

      t.timestamps
    end
  end
end
