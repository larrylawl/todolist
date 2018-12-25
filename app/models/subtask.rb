class Subtask < ApplicationRecord
  belongs_to :task
  acts_as_taggable
  validates :todo, presence: true, length: {minimum: 0}
end
