# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'employees/index', type: :view do
  let(:project_manager) { create(:project_manager) }
  before(:each) do
    assign(:employees, [
             Employee.create!(
               name: 'Name',
               title: 'Title',
               email: 'Email',
               password: 'foobar',
               work_focus: 'Work Focus',
               project_manager:
             ),
             Employee.create!(
               name: 'Name',
               title: 'Title',
               email: 'Email',
               password: 'foobar',
               work_focus: 'Work Focus',
               project_manager:
             )
           ])
  end

  it 'renders a list of employees' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    # removed assertion about password
    assert_select cell_selector, text: Regexp.new('Work Focus'.to_s), count: 2
  end
end
# rubocop:enable Metrics/BlockLength
