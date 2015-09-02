class AddAchieveToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :achieve, :boolean, default: false, null: false
  end
end
