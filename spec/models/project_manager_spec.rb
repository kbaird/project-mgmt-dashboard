require 'rails_helper'

RSpec.describe ProjectManager, type: :model do
  let(:project_manager) { described_class.new }

  describe 'fields' do
    it { expect(project_manager).to respond_to(:name) }
    it { expect(project_manager).to respond_to(:email) }
    it { expect(project_manager).to respond_to(:password_digest) }
  end

  describe 'password' do
    it 'is hashed with bcrypt' do
      pm = described_class.create(name: 'Sample PM', email: 'sample_pm@example.com', password: 'foobar')
      expect(pm.password_digest).not_to eq('foobar')
      expect(pm.authenticate('foobar')).to be(pm)
      expect(pm.authenticate('wrong_password')).to be(false)
    end
  end
end
