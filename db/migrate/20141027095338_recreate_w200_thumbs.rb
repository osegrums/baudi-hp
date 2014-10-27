class RecreateW200Thumbs < ActiveRecord::Migration
  def up
    Thumb.find_each do |thumb|
      thumb.file.recreate_versions!(:w200) if thumb.file
    end
  end

  def down
  end
end
