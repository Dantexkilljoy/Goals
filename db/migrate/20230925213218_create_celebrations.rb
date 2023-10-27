class CreateCelebrations < ActiveRecord::Migration[7.0]
  def change
    create_table :celebrations do |t|
      t.integer :goal_id
      t.date :date
      t.string :activity
      t.string :image

      t.timestamps
    end
  end
end
