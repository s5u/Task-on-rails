class Todo < ActiveRecord::Base
  #association
  belongs_to :task
  belongs_to :task
end
