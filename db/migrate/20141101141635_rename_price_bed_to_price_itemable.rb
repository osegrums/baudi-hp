class RenamePriceBedToPriceItemable < ActiveRecord::Migration
  def change
    rename_column :purchases, :price_bed, :price_itemable
  end
end
