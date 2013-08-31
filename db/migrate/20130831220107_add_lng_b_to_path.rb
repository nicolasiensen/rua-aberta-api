class AddLngBToPath < ActiveRecord::Migration
  def change
    add_column :paths, :lng_b, :string
  end
end
