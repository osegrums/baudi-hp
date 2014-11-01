class CreateLinenPrices < ActiveRecord::Migration
  def change
    create_table :linen_prices do |t|
      t.integer :linen_id
      t.integer :dimension_id
      t.integer :kit_id
      t.decimal :price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
