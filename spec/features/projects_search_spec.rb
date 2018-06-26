# frozen_string_literal: true

# projects search is available on all pages with a header
# but just test that it works rather than checking every page
describe 'projects search on home page', type: :feature, js: true do
  before(:each) do
    visit '/'
  end

  it 'should start collapsed' do
    expect(page.all(:css, '.jstree-closed').count).to be 1
    root_node = page.find(:css, '.jstree-anchor')
    expect(root_node.text).to eq 'Projects'
  end

  it 'should have a root node that links to the projects page' do
    root_node = page.find(:css, '.jstree-anchor')
    projects_page_regex = Regexp.new(@home_page_regex.source + 'projects')
    expect(root_node[:href]).to match projects_page_regex
  end

  xit 'should have an openable root node' do
  end

  xit 'should have project categories' do
  end

  xit 'should have projects under each category' do
  end

  xit 'should link to the project when clicked' do
  end

  xit 'should show relevant results when searched' do
  end
end
