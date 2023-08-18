# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/show', type: :view do
  before(:each) do
    assign(:task, Task.create!(
                    title: 'Title',
                    description: 'MyText',
                    status: 2
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    # needs_review is the human-readable presentation of status: 2
    expect(rendered).to match(/needs_review/)
  end
end
