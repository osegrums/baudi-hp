class RegenerateThumbsW150 < ActiveRecord::Migration
  def up
    Thumb.find_each do |thumb|
      thumb.file.recreate_versions!(:w150) if thumb.file
    end
  end

  def down
  end
end
