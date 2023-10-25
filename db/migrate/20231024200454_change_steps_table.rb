class ChangeStepsTable< ActiveRecord::Migration[7.0]
  def change
    change_column :steps, :time_allotted, :datetime
  end
end
