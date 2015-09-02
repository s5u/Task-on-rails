class RemoveArchieveFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :archieve, :integer
  end
end
