class RemoveTimeFromActionPlan < ActiveRecord::Migration[7.0]
  def change
    remove_column :action_plans, :time
  end
end
