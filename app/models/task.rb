# frozen_string_literal: true

# A unit of work, assigned to an Employee
class Task < ApplicationRecord
  STATUSES = { not_started: 0, working: 1, needs_review: 2, done: 3, late: 4 }.freeze
  enum :status, STATUSES

  has_many :sub_tasks, class_name: 'Task', foreign_key: 'parent_id'
  belongs_to :project, optional: true

  scope :not_done, -> { where('status != ?', STATUSES[:done]) }
  scope :overdue, -> { where('due_at < ?', DateTime.now) }

  def attempt_update(task_params, current_user_id)
    case task_params[:status]
    when 'done'
      complete(current_user_id)
    else
      update(task_params)
    end
  end

  ### TODO(kbaird): Only PM can create

  # The presumption is that we will pass the current_user from the controller in.
  def complete(current_user_id)
    raise DisallowedError if current_user_id != assigned_project_manager_id

    done!
  end

  ### TODO(kbaird): Only assigned Employee(s) can set to working/needs_review
end
