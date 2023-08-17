# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/index', type: :view do
  before(:each) do
    assign(:tasks, [
             Task.create!(
               title: 'Title',
               description: 'MyText',
               status: 2
             ),
             Task.create!(
               title: 'Title',
               description: 'MyText',
               status: 2
             )
           ])
  end

  it 'renders a list of tasks' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    # needs_review is the human-readable presentation of status: 2
    assert_select cell_selector, text: Regexp.new('needs_review'.to_s), count: 2
  end
end
