class AddIsKitImageToThumbs < ActiveRecord::Migration
  def change
    add_column :thumbs, :is_kit_image, :boolean, default: false
  end
end
