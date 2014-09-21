class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.string :code
      t.string :name
      t.integer :sequence
      t.boolean :has_decoration
      t.boolean :has_rack
      t.text :description_lv
      t.text :description_ru
      t.text :description_en

      t.timestamps
    end
  end
end
