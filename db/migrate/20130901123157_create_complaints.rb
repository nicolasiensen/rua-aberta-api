class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :car_plate
      t.string :category
      t.string :lat
      t.string :lng
      t.text :note

      t.timestamps
    end
  end
end
