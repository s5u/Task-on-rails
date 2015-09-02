class AddAchieveToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :achieve, :boolean, default: false, null: false
  end
end
