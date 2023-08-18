# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { 'MyString' }
    description { 'MyText' }
    due_at { '2023-08-17 10:15:25' }
  end
end
