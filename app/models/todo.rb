class Todo < ActiveRecord::Base
  #association
  belongs_to :tasks
end
