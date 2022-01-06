# frozen_string_literal: true

# projects search is available on all pages with a header
# but just test that it works rather than checking every page
describe "projects search on home page", type: :feature, js: true do
  before(:each) do
    visit "/"
    @root_node = page.find(:css, ".jstree-anchor")
    icon_css = "#projects-tree .jstree-icon.jstree-ocl"
    # get root node toggle icon in advance to easily open and close
    # the entire js tree
    @root_node_toggle_icon = page.find(:css, icon_css)
  end

  it "should start collapsed" do
    expect(page.all(:css, ".jstree-closed").count).to be 1
    expect(@root_node.text).to eq "Projects"
  end

  it "should have a root node that links to the projects page" do
    projects_page_regex = Regexp.new("#{@home_page_regex.source}projects")
    expect(@root_node[:href]).to match projects_page_regex
    # actuall visit the link to make sure it's working (no jstree bugs)
    @root_node.click
    expect(current_url).to match projects_page_regex
  end

  context "when the root projects node is open" do
    before { @root_node_toggle_icon.click }
    after { @root_node_toggle_icon.click }
    it "should have project categories" do
      categories = ["Blog", "College", "Open source", "Personal"]
      categories.each do |category|
        category_xpath = "//a[contains(@class, 'jstree-anchor')" \
          " and contains(text(), '#{category}')]"
        expect(page).to have_xpath(category_xpath)
      end
    end
    context "when the first category node is opened" do
      before do
        # icon_css = '#j1_2 > i'
        # @college_category_toggle_icon = page.find(:css, icon_css)
        college_folder_xpath = "//a[contains(@class, 'jstree-anchor')"\
          " and contains(text(), 'College')]"
        college_icon_xpath = "#{college_folder_xpath}/preceding-sibling::i"
        @college_category_toggle_icon = page.find(:xpath, college_icon_xpath)
        @college_category_toggle_icon.click
      end
      after do
        @college_category_toggle_icon.click
      end
      it "should have nodes with links to each project" do
        clickable_nodes = page.all(".clickable-tree-node")
        # more than just the root should be clickable
        expect(clickable_nodes.count).to be > 1
      end

      # specific tests for projects
      # (testing config/data rather than functionality)
      # could possibly be in it's own test category / folder / test file
      # xit 'should have a dublin bikes project'
      # xit 'should have a Restimator project'
    end
  end

  # TODO: relies on dublin bikes project, stub later?
  it "should show relevant results when searched" do
    search_input = page.find(:css, "#projects-search-input")
    search_input.send_keys("dublin bikes")
    results = page.all(".jstree-search")
    expect(results.count).to eq 1
    expect(results[0].text).to eq "Dublin Bikes"
  end
end
