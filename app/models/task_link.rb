class TaskLink < ApplicationRecord
  belongs_to :source_task, class_name: 'Task'
  belongs_to :target_task, class_name: 'Task'
  belongs_to :link_type, class_name: 'TaskLinkType'

  validates :source_task, :target_task, :link_type, presence: true
  validate :no_self_referential_links
  validate :tasks_from_same_project
  validate :no_duplicate_links
  validate :no_circular_dependencies, if: -> { link_type&.name == TaskLinkType::PARENT_CHILD }

  private

  def no_self_referential_links
    if source_task_id == target_task_id
      errors.add(:base, "Task cannot be linked to itself")
    end
  end

  def tasks_from_same_project
    return unless source_task && target_task

    if source_task.project_id != target_task.project_id
      errors.add(:base, "Tasks must belong to the same project")
    end
  end

  def no_duplicate_links
    return unless source_task_id && target_task_id && link_type_id

    if TaskLink.exists?(
      source_task_id: source_task_id,
      target_task_id: target_task_id,
      link_type_id: link_type_id
    )
      errors.add(:base, "This relationship already exists")
    end
  end

  def no_circular_dependencies
    true
  end
end
