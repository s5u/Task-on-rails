class RemoveAchieveFromTargets < ActiveRecord::Migration
  def change
    remove_column :targets, :achieve, :integer
  end
end
