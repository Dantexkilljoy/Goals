class CreateActionPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :action_plans do |t|
      t.string :time
      t.integer :goal_id
      t.date :date

      t.timestamps
    end
  end
end
