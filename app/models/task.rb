class Task < ActiveRecord::Base
  #association
  belongs_to :target
  has_many   :todos, dependent: :destroy
end
