# frozen_string_literal: true

require 'rails_helper'

LEGAL_STATUSES = %i[not_started working needs_review done late].freeze

RSpec.describe Task, type: :model do
  let(:task) { described_class.new }

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
end
