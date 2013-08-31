class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :point_a
      t.string :point_b
      t.boolean :parking

      t.timestamps
    end
  end
end
