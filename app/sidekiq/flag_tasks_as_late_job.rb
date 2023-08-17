# frozen_string_literal: true

# Converts Tasks to 'late' when overdue
### TODO(kbaird): Add scheduling
class FlagTasksAsLateJob
  include Sidekiq::Job

  def perform
    Task.overdue.update_all(status: 'late')
  end
end
