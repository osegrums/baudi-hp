class FixBedPrices < ActiveRecord::Migration
  def up
    execute 'DELETE FROM bed_prices WHERE dimension_id NOT IN (select id from dimensions)'
    execute 'DELETE FROM bed_prices WHERE ID IN (SELECT MIN(id) FROM bed_prices GROUP BY bed_id, dimension_id, has_decoration, has_rack HAVING COUNT(id) > 1)'
  end

  def down
  end
end
