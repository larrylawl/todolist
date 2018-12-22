class Task < ApplicationRecord
  acts_as_taggable
  validates :todo, presence: true, length: {minimum: 0}
end
