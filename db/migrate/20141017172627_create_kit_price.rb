class CreateKitPrice < ActiveRecord::Migration
  def change
    create_table :kit_prices do |t|
      t.integer :bed_id
      t.integer :kit_id
      t.integer :dimension_id
      t.decimal :price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end

    execute "DELETE FROM bed_prices WHERE kit_id IN (SELECT id FROM kits WHERE name_lv IN ('1 komplekts', '2 komplekti'))"
  end
end
