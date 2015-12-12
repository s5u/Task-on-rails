class AddRowOrderToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :row_order, :integer
  end
end
