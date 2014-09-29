class CreateBedPurchases < ActiveRecord::Migration
  def change
    create_table :bed_purchases do |t|
      t.string  :uid
      t.integer :bed_id
      t.integer :bed_price_id
      t.integer :color_id
      t.decimal :price, precision: 10, scale: 2
      t.string  :name
      t.string  :email
      t.string  :phone
      t.text    :notes
      t.string  :state
      t.string  :ip_address

      t.timestamps
    end
  end
end
