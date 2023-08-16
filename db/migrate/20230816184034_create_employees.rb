# frozen_string_literal: true

# ./bin/rails g model Employee project_manager:references name:string title:string
#   email:string password_digest:string work_focus:string
class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.references :project_manager, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :title
      t.string :email
      t.string :password_digest
      t.string :work_focus, comment: 'ex: development, design, business, research, etc.'

      t.timestamps
    end
  end
end
