# frozen_string_literal: true

# Generic Model ancestor
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
