class RemoveBootsyTables < ActiveRecord::Migration
  def change
    drop_table :bootsy_images
    drop_table :bootsy_image_galleries
  end
end
