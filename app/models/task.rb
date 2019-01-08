class Task < ApplicationRecord
  # Wipe out taggings as they are no longer needed
  has_many :taggings, dependent: :destroy 
  has_many :tags, through: :taggings
  has_many :subtasks, dependent: :destroy
  validates :title, presence: true, length: {minimum: 0}
  after_initialize :init

  def init
  	self.completed ||= 0
  	self.details ||= ""
  end

  # Not!
  def tagged_with(tag)
    self.tags.find_by(name: tag)
  end

  def tag_list=(names)
    self.tags =  names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  # Returns a string
  def tag_list
    self.tags.map{|tag| tag.name}
  end
end
