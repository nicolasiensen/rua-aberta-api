class RemovePointBFromPath < ActiveRecord::Migration
  def up
    remove_column :paths, :point_b
  end

  def down
    add_column :paths, :point_b, :string
  end
end
