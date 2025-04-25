class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true, length: { maximum: 255 }
  validates :due_date, presence: true
  validates :status, presence: true

  has_many :source_task_links,
           class_name: 'TaskLink',
           foreign_key: :source_task_id,
           dependent: :destroy

  has_many :target_task_links,
           class_name: 'TaskLink',
           foreign_key: :target_task_id,
           dependent: :destroy

  has_many :linked_tasks, through: :outward_links, source: :target_task
  has_many :reverse_linked_tasks, through: :inward_links, source: :source_task


  enum :status, {
    open: 0,
    in_progress: 1,
    completed: 2,
    on_hold: 3
  }

  scope :active, -> { where(created_at: 6.months.ago..Time.current) }
  scope :ordered, -> { order(created_at: :desc) }
end
