# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'employees/show', type: :view do
  let(:project_manager) { create(:project_manager) }
  before(:each) do
    assign(:employee, Employee.create!(
                        name: 'Name',
                        title: 'Title',
                        email: 'Email',
                        password: 'foobar',
                        work_focus: 'Work Focus',
                        project_manager:
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Work Focus/)
  end
end
