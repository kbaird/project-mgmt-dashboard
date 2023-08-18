# frozen_string_literal: true

# A user emppowered to
# - Create Employees
# - Create Tasks
# - Switch Tasks to 'done`
# - Create Projects
class ProjectManager < ApplicationRecord
  has_secure_password
end
