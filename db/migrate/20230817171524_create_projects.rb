# frozen_string_literal: true

# ./bin/rails g model Project title:string description:text due_at:datetime
class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :title
      t.text :description
      t.datetime :due_at

      t.timestamps
    end
  end
end
