class AddDescriptionToKits < ActiveRecord::Migration
  def change
    add_column :kits, :description_lv, :text
    add_column :kits, :description_en, :text
    add_column :kits, :description_ru, :text
  end
end
