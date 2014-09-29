class AddIsDefaultToDimensions < ActiveRecord::Migration
  def change
    add_column :dimensions, :is_default, :boolean, default: false
  end
end
