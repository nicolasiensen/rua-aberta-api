class AddLatAToPath < ActiveRecord::Migration
  def change
    add_column :paths, :lat_a, :string
  end
end
