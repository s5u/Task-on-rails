class Task < ActiveRecord::Base
  include RankedModel
  ranks :row_order, with_same: :target_id

  #association
  belongs_to :target
  has_many   :todos, dependent: :destroy

  def self.task_achieve_judge(tasks,tasks_achieves,tasks_achieved)
    tasks.each do |task|
      if task.achieve == true
        tasks_achieves << 1
      end
    end
    if tasks.length == tasks_achieves.length
      tasks_achieved = true
    end
    return tasks_achieved
  end
end
