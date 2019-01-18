class Task < ApplicationRecord
  # Wipe out taggings as they are no longer needed
  has_many :taggings, dependent: :destroy 
  has_many :tags, through: :taggings
  validates :title, presence: true, length: {minimum: 0}
  after_initialize :init

  def init
  	self.completed ||= 0
  	self.details ||= ""
  end

  # Return an array of tasks that's not tagged
  def self.not_tagged_with(tag)
    untagged = [];
    Task.all.each do |task|
      if !task.tags.exists?(name: tag)
        untagged.push(task)
      end
    end
    return untagged
  end

  def tag_list=(names)
    self.tags =  names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def tag_list
    self.tags.map{|tag| tag.name}
  end
end
