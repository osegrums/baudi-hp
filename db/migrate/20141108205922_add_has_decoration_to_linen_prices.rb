class AddHasDecorationToLinenPrices < ActiveRecord::Migration
  def change
    add_column :linen_prices, :has_decoration, :boolean, default: false
  end
end
