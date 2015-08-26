class AddTargetIdToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :target_id, :integer
  end
end
