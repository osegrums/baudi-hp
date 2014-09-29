class AddShortNameToDimensions < ActiveRecord::Migration
  def change
    add_column :dimensions, :short_name, :string
  end
end
