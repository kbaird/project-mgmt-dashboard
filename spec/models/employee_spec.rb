# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { described_class.new }

  describe 'fields' do
    it { expect(employee).to respond_to(:name) }
    it { expect(employee).to respond_to(:title) }
    it { expect(employee).to respond_to(:email) }
    it { expect(employee).to respond_to(:password) }
    it { expect(employee).to respond_to(:work_focus) }
  end

  describe 'password' do
    it 'is hashed with bcrypt' do
      emp = described_class.create(
        name: 'Sample PM',
        email: 'sample_employee@example.com',
        password: 'foobar',
        title: 'Sample title',
        work_focus: 'Research'
      )
      expect(emp.password_digest).not_to eq('foobar')
      expect(emp.authenticate('foobar')).to be(emp)
      expect(emp.authenticate('wrong_password')).to be(false)
    end
  end
end
