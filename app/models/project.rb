# frozen_string_literal: true

# Unit of work, contains Tasks
class Project < ApplicationRecord
  has_many :tasks

  ### TODO(kbaird): Only PM can create
end
