class AddHasDecorationToLinens < ActiveRecord::Migration
  def change
    add_column :linens, :has_decoration, :boolean, default: false
  end
end
