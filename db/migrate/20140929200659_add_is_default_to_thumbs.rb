class AddIsDefaultToThumbs < ActiveRecord::Migration
  def change
    add_column :thumbs, :is_default, :boolean, default: false
  end
end
