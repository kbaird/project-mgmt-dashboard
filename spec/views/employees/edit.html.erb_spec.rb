# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/edit', type: :view do
  let(:project_manager) { create(:project_manager) }
  let(:employee) do
    Employee.create!(
      name: 'MyString',
      title: 'MyString',
      email: 'MyString',
      password: 'foobar',
      work_focus: 'MyString',
      project_manager:
    )
  end

  before(:each) do
    assign(:employee, employee)
  end

  it 'renders the edit employee form' do
    render

    assert_select 'form[action=?][method=?]', employee_path(employee), 'post' do
      assert_select 'input[name=?]', 'employee[name]'

      assert_select 'input[name=?]', 'employee[title]'

      assert_select 'input[name=?]', 'employee[email]'

      assert_select 'input[name=?]', 'employee[password]'

      assert_select 'input[name=?]', 'employee[work_focus]'
    end
  end
end
