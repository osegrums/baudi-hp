class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.string  :name
      t.integer :itemable_id
      t.string  :itemable_type

      t.timestamps
    end
  end
end
