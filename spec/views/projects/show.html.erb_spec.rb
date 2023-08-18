# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  before(:each) do
    assign(:project, Project.create!(
                       title: 'Title',
                       description: 'MyText'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end

  it 'links to the Tasks' do
    render
    expect(rendered).to match(/List this project.*s Tasks/)
  end
end
