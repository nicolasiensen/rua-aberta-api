class CreateObstacles < ActiveRecord::Migration
  def change
    create_table :obstacles do |t|
      t.string :category
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
