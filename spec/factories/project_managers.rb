# frozen_string_literal: true

FactoryBot.define do
  factory :project_manager do
    name { 'Sample PM' }
    email { 'sample_pm@example.com' }
    password { 'foobar' }
  end
end
