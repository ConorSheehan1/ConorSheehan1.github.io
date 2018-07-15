# frozen_string_literal: true

describe 'project page', type: :feature, js: true do
  before(:each) do
    visit '/projects'
    page.all('.post-link').first.click
  end

  include_examples 'base'

  it 'should have a back to projects button' do
    expect(page).to_not have_current_path('/projects')
    @back_to_projects_button = page.find('.back-to-projects')
    @back_to_projects_button.click
    expect(page).to have_current_path('/projects')
  end
  # this won't change: all projects must have source code
  it 'should have a source code link' do
    expect(page).to have_css('#source-code-link')
  end
  # this may change: support projetcts without live site links?
  it 'should have a live site link' do
    expect(page).to have_css('#live-site-link')
  end
end
