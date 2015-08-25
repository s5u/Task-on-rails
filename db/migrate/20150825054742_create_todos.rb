class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string    :name
      t.text      :text
      t.integer   :task_id
      t.boolean   :archieve, default: false
      t.timestamps
    end
  end
end
