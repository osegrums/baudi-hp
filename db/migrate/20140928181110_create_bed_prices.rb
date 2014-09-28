class CreateBedPrices < ActiveRecord::Migration
  def change
    create_table :bed_prices do |t|
      t.integer :bed_id
      t.boolean :has_decoration, default: false
      t.boolean :has_rack, default: false
      t.integer :dimension_id
      t.integer :kit_id
      t.decimal :price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
