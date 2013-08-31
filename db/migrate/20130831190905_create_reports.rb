class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :path_id

      t.timestamps
    end
  end
end
