class Target < ActiveRecord::Base
  include RankedModel
  ranks :row_order, with_same: :user_id

  #association
  has_many :tasks, dependent: :destroy
  has_many :todos, dependent: :destroy
  belongs_to :user

  def self.target_achieve_judge(targets, user_id)
    targets.each do |target|
        tasks = Task.where(target_id: target.id).where(user_id: user_id)
        tasks_achieves = []
        if tasks.present?
          tasks.each do |task|
          tasks_achieves << 1 if task.achieve == true
          end
        else
          target.achieve = true
          target.save
        end
      if tasks_achieves.length == tasks.length
        target.achieve = true
      else
        target.achieve = false
      end
      target.save
    end
  end

end