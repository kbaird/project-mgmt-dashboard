# frozen_string_literal: true

# Allows Tasks to own Sub-Tasks
class AddParentIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :parent_id, :uuid
  end
end
