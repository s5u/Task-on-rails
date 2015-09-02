class RemoveAchieveFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :achieve, :integer
  end
end
