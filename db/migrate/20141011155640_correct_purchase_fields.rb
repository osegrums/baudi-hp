class CorrectPurchaseFields < ActiveRecord::Migration
  def change
    add_column :bed_purchases, :address, :string
    add_column :bed_purchases, :zip_code, :string
    add_column :bed_purchases, :city, :string
    add_column :bed_purchases, :country, :string
    change_column :bed_purchases, :state, :string, default: 'new'
  end
end
