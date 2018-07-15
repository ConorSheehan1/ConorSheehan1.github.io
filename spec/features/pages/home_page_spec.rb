# frozen_string_literal: true

describe 'home page', type: :feature, js: true do
  before(:each) do
    visit '/'
  end

  include_examples 'base'

  it 'should have a title' do
    expect(page).to have_title 'Conor Sheehan'
  end
end
