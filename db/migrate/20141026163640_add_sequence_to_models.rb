class AddSequenceToModels < ActiveRecord::Migration
  def change
    add_column :colors, :sequence, :integer, default: 0
    add_column :kits, :sequence, :integer, default: 0
    add_column :dimensions, :sequence, :integer, default: 0
  end
end
