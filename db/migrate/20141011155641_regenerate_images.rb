class RegenerateImages < ActiveRecord::Migration
  def up
    Thumb.find_each do |thumb|
      thumb.file.recreate_versions! if thumb.file
    end
  end

  def down
  end
end
