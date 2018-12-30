class Task < ApplicationRecord
  has_many :subtasks, dependent: :destroy
  acts_as_taggable
  validates :title, presence: true, length: {minimum: 0}
end
