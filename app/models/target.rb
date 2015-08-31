class Target < ActiveRecord::Base
  #association
  has_many :tasks, dependent: :destroy
  has_many :todos, dependent: :destroy

end
