class AddKitPriceIdToBedPurchases < ActiveRecord::Migration
  def change
    add_column :bed_purchases, :kit_price_id, :integer
    add_column :bed_purchases, :price_kit, :decimal, precision: 10, scale: 2
    add_column :bed_purchases, :price_bed, :decimal, precision: 10, scale: 2
  end
end
