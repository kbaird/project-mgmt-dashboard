# frozen_string_literal: true

require 'rails_helper'

LEGAL_STATUSES = %i[not_started working needs_review done late].freeze

# rubocop:disable Metrics/BlockLength
RSpec.describe Task, type: :model do
  let(:task) { described_class.new }

  describe 'associations' do
    it 'can be assigned to an Employee' do
      employee = build(:employee)
      described_class.create!(assigned_employee_id: employee.id)
    end
    it 'can be assigned to a ProjectManager' do
      pm = build(:project_manager)
      described_class.create!(assigned_project_manager_id: pm.id)
    end
  end

  describe 'nesting' do
    let(:big_task) { create(:task) }
    let(:sub_task1) { create(:task, parent_id: big_task.id) }
    let(:sub_task2) { create(:task, parent_id: big_task.id) }
    let(:sub_task3) { create(:task, parent_id: big_task.id) }
    it 'has sub_tasks' do
      [sub_task1, sub_task2, sub_task3].each do |sub_task|
        expect(big_task.sub_tasks).to include(sub_task)
      end
    end
  end

  describe 'fields' do
    it { expect(task).to respond_to(:title) }
    it { expect(task).to respond_to(:description) }
    it { expect(task).to respond_to(:work_focus) }
    it { expect(task).to respond_to(:due_at) }
    it { expect(task).to respond_to(:status) }
  end

  describe 'status' do
    LEGAL_STATUSES.each do |legal_status|
      it "accepts #{legal_status} as a legal status" do
        described_class.create!(status: legal_status)
      end
    end
    it "does not accept a status of 'foo'" do
      expect { described_class.create!(status: 'foo') }.to raise_error(ArgumentError, /is not a valid status/)
    end
  end

  describe '#complete' do
    let(:pm) { create(:project_manager) }
    let(:task) { create(:task, assigned_project_manager_id: pm.id) }
    describe 'when given a current_user who is the owning ProjectManager' do
      let(:current_user) { pm }
      it 'updates the :status to :done' do
        task.complete(current_user)
        expect(task.reload.status).to eq('done')
      end
    end
    describe 'when given a current_user who is not the owning ProjectManager' do
      let(:current_user) { create(:project_manager) }
      it 'raises a DisallowedError' do
        expect { task.complete(current_user) }.to raise_error(DisallowedError)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
