class AddIsDefaultToKits < ActiveRecord::Migration
  def change
    add_column :kits, :is_default, :boolean, default: false
  end
end
