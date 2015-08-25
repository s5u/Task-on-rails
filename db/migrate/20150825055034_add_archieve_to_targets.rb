class AddArchieveToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :archieve, :boolean, default: false
  end
end
