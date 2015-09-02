class RemoveArchieveFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :archieve, :integer
  end
end
