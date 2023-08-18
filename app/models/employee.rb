# frozen_string_literal: true

# A human who reports to a ProjectManager and works on Tasks
class Employee < ApplicationRecord
  has_secure_password
  belongs_to :project_manager
end
