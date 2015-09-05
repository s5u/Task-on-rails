class Task < ActiveRecord::Base
  #association
  belongs_to :target
  has_many   :todos, dependent: :destroy


  # def find_current_user(user)
  #   Task.where(user_id: user.id)
  # end
end
