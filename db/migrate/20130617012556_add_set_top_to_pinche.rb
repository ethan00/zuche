class AddSetTopToPinche < ActiveRecord::Migration
  def change
    add_column :pinches, :set_top, :integer, :default => 999
    Pinche.all.each do |pinche|
      pinche.update_attributes!(:set_top => 999)
    end
    add_index :pinches, :set_top
  end



end
