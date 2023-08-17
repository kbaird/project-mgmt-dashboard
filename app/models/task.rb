# frozen_string_literal: true

# A unit of work, assigned to an Employee
class Task < ApplicationRecord
  STATUSES = { not_started: 0, working: 1, needs_review: 2, done: 3, late: 4 }.freeze
  enum :status, STATUSES
  has_many :sub_tasks, class_name: 'Task', foreign_key: 'parent_id'

  scope :overdue, -> { where('due_at < ?', DateTime.now) }

  # The presumption is that we will pass the current_user from the controller in.
  def complete(current_user)
    raise DisallowedError if current_user.id != assigned_project_manager_id

    done!
  end
end
