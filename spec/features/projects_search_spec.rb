# frozen_string_literal: true

# projects search is available on all pages with a header
# but just test that it works rather than checking every page
describe 'projects search on home page', type: :feature, js: true do
  before(:each) do
    visit '/'
    @root_node = page.find(:css, '.jstree-anchor')
    icon_css = '#projects_tree .jstree-icon.jstree-ocl'
    # get root node toggle icon in advance to easily open and close
    # the entire js tree
    @root_node_toggle_icon = page.find(:css, icon_css)
  end

  it 'should start collapsed' do
    expect(page.all(:css, '.jstree-closed').count).to be 1
    expect(@root_node.text).to eq 'Projects'
  end

  it 'should have a root node that links to the projects page' do
    projects_page_regex = Regexp.new(@home_page_regex.source + 'projects')
    expect(@root_node[:href]).to match projects_page_regex
    # actuall visit the link to make sure it's working (no jstree bugs)
    @root_node.click
    expect(current_url).to match projects_page_regex
  end

  context 'when the root projects node is open' do
    before { @root_node_toggle_icon.click }
    after { @root_node_toggle_icon.click }
    it 'should have project categories' do
      categories = ['College', 'Personal', 'Open source']
      categories.each do |category|
        category_xpath = "//a[contains(@class, 'jstree-anchor')" \
          " and contains(text(), '#{category}')]"
        expect(page).to have_xpath(category_xpath)
      end
    end
    context 'when a category node is opened' do
      # before do
      #   icon_css = '.jstree-node.jstree-closed > i'
      #   category_toggle_icon = page.all(:css, icon_css)
      # end
      xit 'should have nodes with links to each project' do
      end
    end
  end

  xit 'should show relevant results when searched' do
  end
end
