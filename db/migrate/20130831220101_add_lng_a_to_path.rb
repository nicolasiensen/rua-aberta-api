class AddLngAToPath < ActiveRecord::Migration
  def change
    add_column :paths, :lng_a, :string
  end
end
