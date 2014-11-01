class RenameBedPurchasesToPurchases < ActiveRecord::Migration
  def change
    rename_table  :bed_purchases, :purchases
    rename_column :purchases, :bed_id, :itemable_id
    rename_column :purchases, :bed_price_id, :itemable_price_id
    add_column    :purchases, :itemable_type, :string
    add_column    :purchases, :itemable_price_type, :string

    execute "UPDATE purchases SET itemable_type='Bed', itemable_price_type='BedPrice'"
  end
end
