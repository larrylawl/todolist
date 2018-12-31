class Subtask < ApplicationRecord
  belongs_to :task
  validates :title, presence: true, length: {minimum: 0}
end
