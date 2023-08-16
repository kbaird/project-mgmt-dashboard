class CreateProjectManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_managers, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
