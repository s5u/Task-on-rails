class AddRowOrderToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :row_order, :integer
  end
end
