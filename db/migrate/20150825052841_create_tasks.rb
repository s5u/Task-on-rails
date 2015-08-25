class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string    :name
      t.text      :text
      t.integer   :target_id
      t.boolean   :archieve, default: false
      t.timestamp
    end
  end
end
