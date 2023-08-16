# frozen_string_literal: true

# A unit of work, assigned to an Employee
class Task < ApplicationRecord
  enum :status, %i[not_started working needs_review done late]
  has_many :sub_tasks, class_name: 'Task', foreign_key: 'parent_id'
end
