class AddLatBToPath < ActiveRecord::Migration
  def change
    add_column :paths, :lat_b, :string
  end
end
