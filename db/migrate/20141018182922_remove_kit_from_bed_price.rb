class RemoveKitFromBedPrice < ActiveRecord::Migration
  def change
    remove_column :bed_prices, :kit_id, :integer
  end
end
