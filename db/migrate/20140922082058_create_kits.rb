class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.integer :itemable_id
      t.string  :itemable_type
      t.string  :name_lv
      t.string  :name_en
      t.string  :name_ru

      t.timestamps
    end
  end
end
