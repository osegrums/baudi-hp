class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.integer :thumbable_id
      t.string  :thumbable_type
      t.string  :file
      t.integer :sequence
      t.text    :description
      t.string  :name

      t.timestamps
    end
  end
end
