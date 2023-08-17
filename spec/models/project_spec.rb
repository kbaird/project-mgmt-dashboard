# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { described_class.new }

  describe 'fields' do
    it { expect(project).to respond_to(:title) }
    it { expect(project).to respond_to(:description) }
    it { expect(project).to respond_to(:due_at) }
  end
end
