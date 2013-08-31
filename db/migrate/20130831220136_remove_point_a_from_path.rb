class RemovePointAFromPath < ActiveRecord::Migration
  def up
    remove_column :paths, :point_a
  end

  def down
    add_column :paths, :point_a, :string
  end
end
