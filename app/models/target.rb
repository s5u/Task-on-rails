class Target < ActiveRecord::Base
  #association
  has_many :tasks, dependent: :destroy
end
