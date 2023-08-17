# frozen_string_literal: true

# ./bin/rails g migration AddProjectIdToTasks project:references
class AddProjectIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :project, null: true, foreign_key: true, type: :uuid
  end
end
