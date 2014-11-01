class CreateLinens < ActiveRecord::Migration
  def change
    create_table :linens do |t|
      t.string :code
      t.string :name
      t.integer :sequence
      t.text :description_lv
      t.text :description_ru
      t.text :description_en

      t.timestamps
    end
  end
end
