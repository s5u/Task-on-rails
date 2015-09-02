class RemoveArchieveFromTargets < ActiveRecord::Migration
  def change
    remove_column :targets, :archieve, :integer
  end
end
