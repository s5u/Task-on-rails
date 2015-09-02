class AddAchieveToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :achieve, :boolean, default: false, null: false
  end
end
