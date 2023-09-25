class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.string :name
      t.string :resources
      t.string :skills
      t.string :time_allotted
      t.integer :action_plan_id

      t.timestamps
    end
  end
end
