# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/new', type: :view do
  before(:each) do
    assign(:employee, Employee.new(
                        name: 'MyString',
                        title: 'MyString',
                        email: 'MyString',
                        password: '',
                        work_focus: 'MyString'
                      ))
  end

  it 'renders new employee form' do
    render

    assert_select 'form[action=?][method=?]', employees_path, 'post' do
      assert_select 'input[name=?]', 'employee[name]'

      assert_select 'input[name=?]', 'employee[title]'

      assert_select 'input[name=?]', 'employee[email]'

      assert_select 'input[name=?]', 'employee[password]'

      assert_select 'input[name=?]', 'employee[work_focus]'
    end
  end
end
