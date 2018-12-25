class Task < ApplicationRecord
  has_many :subtasks
  acts_as_taggable
  validates :todo, presence: true, length: {minimum: 0}
end
