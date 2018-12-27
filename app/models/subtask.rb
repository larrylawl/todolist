class Subtask < ApplicationRecord
  belongs_to :task
  validates :todo, presence: true, length: {minimum: 0}
end
