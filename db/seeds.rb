# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

project_manager = ProjectManager.create(
  name: 'Sample PM',
  email: 'sample_pm@example.com',
  password: 'foobar'
)
p project_manager.inspect

employee = Employee.create(
  name: 'Sample Employee',
  email: 'sample_employee@example.com',
  password: 'foobar',
  title: 'Sample title',
  work_focus: 'Research',
  project_manager_id: project_manager.id
)
p employee.inspect

project = Project.create(
  title: 'Sample Project',
  description: 'Contains the seeded Task',
  due_at: '2023-09-01'
)
p project.inspect

task = Task.create(
  title: 'Sample Task',
  due_at: '2023-09-01',
  project_id: project.id,
  assigned_project_manager_id: project_manager.id,
  assigned_employee_id: employee.id
)
p task.inspect
