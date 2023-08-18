# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { described_class.new }

  describe 'associations' do
    let(:task1) { create(:task, project:) }
    let(:task2) { create(:task, project:) }
    let(:task3) { create(:task, project:) }
    it 'has_many tasks' do
      [task1, task2, task3].each do |task|
        expect(project.tasks).to include(task)
      end
    end
  end

  describe 'fields' do
    it { expect(project).to respond_to(:title) }
    it { expect(project).to respond_to(:description) }
    it { expect(project).to respond_to(:due_at) }
  end
end
