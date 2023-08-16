# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { 'Sample Employee' }
    email { 'sample_employee@example.com' }
    password { 'foobar' }
    title { 'Sample title' }
    work_focus { 'Research' }
  end
end
