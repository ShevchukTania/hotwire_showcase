class TaskLinkType < ApplicationRecord
  has_many :task_links, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :source_relationship, presence: true
  validates :target_relationship, presence: true

  PARENT_CHILD = 'parent_child'
  BLOCKS = 'blocks'
  RELATES_TO = 'relates'
end
