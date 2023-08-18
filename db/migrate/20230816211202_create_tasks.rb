# frozen_string_literal: true

# ./bin/rails g model Task assigned_employee_id:uuid assigned_project_manager_id:uuid
#   title:string description:text work_focus:string due_at:datetime status:integer
class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.uuid :assigned_employee_id
      t.uuid :assigned_project_manager_id
      t.string :title
      t.text :description
      t.string :work_focus
      t.datetime :due_at
      t.integer :status, comment: 'Enum, see Task model'

      t.timestamps
    end
  end
end
