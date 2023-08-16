# frozen_string_literal: true

# A unit of work, assigned to an Employee
class Task < ApplicationRecord
  enum :status, %i[not_started working needs_review done late]
  has_many :sub_tasks, class_name: 'Task', foreign_key: 'parent_id'

  # The presumption is that we will pass the current_user from the controller in.
  def complete(current_user)
    raise DisallowedError if current_user.id != assigned_project_manager_id

    update(status: :done)
  end
end
