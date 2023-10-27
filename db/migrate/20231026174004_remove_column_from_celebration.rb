class RemoveColumnFromCelebration < ActiveRecord::Migration[7.0]
  def change
    remove_column :celebrations, :date
  end
end
