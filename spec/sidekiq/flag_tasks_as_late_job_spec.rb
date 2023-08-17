# frozen_string_literal: true

require 'rails_helper'
RSpec.describe FlagTasksAsLateJob, type: :job do
  describe '#perform' do
    let(:overdue_task) { create(:task, due_at: Time.now - 2.hours, status: 'working') }
    let(:future_task) { create(:task, due_at: Time.now + 2.hours, status: 'working') }
    it "converts a Task due_at a time before now to 'late' status" do
      expect(overdue_task.status).to eq('working')
      described_class.perform_inline
      expect(overdue_task.reload.status).to eq('late')
    end
    it 'does nothing to a Task whose due_at is still in the future' do
      expect(future_task.status).to eq('working')
      described_class.perform_inline
      expect(future_task.reload.status).to eq('working')
    end
  end
end
