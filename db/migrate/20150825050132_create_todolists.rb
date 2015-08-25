class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string  :name
      t.text    :text
      t.integer :task_id
      t.integer :category
      t.timestamps
    end
  end
end
