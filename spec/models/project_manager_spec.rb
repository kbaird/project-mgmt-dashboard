require 'rails_helper'

RSpec.describe ProjectManager, type: :model do
  let(:project_manager) { described_class.new }

  describe 'fields' do
    it { expect(project_manager).to respond_to(:name) }
    it { expect(project_manager).to respond_to(:email) }
    it { expect(project_manager).to respond_to(:password_digest) }
  end
end
