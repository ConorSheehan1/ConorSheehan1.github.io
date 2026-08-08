# frozen_string_literal: true

# projects search is available on all pages with a header
# but just test that it works rather than checking every page
describe "theme toggle", type: :feature, js: true do
  # before(:all) do
  #   visit '/'
  # end

  before(:each) do
    visit "/"
    # need to clean local storage to ensure correct default theme state
    page.execute_script("window.localStorage.setItem('theme', 'dark');")
    page.refresh
    @theme_toggle = page.find(:css, "#theme-toggle")
    # Use JS style lookup since native element style access is not available with Cuprite
    @dark_backgrounds = ["rgba(55, 55, 55, 1)", "rgb(55, 55, 55)"] # #373737
    @light_backgrounds = ["rgba(242, 242, 242, 1)", "rgb(242, 242, 242)"] # #f2f2f2
  end

  describe "initial page load" do
    it_should_behave_like "theme", "dark"
    it "should have a dark background" do
      color = page.evaluate_script("window.getComputedStyle(document.body).backgroundColor")
      expect(@dark_backgrounds).to include(color)
    end
    it "should have a default-dark js-tree theme" do
      expect(page).to have_css("#projects-tree.jstree-default-dark")
    end
  end

  describe "single toggle" do
    before { @theme_toggle.click }
    it_should_behave_like "theme", "light"
    it "should have a light background" do
      color = page.evaluate_script("window.getComputedStyle(document.body).backgroundColor")
      expect(@light_backgrounds).to include(color)
    end
    it "should have a default js-tree theme" do
      expect(page).to have_css("#projects-tree.jstree-default")
    end
  end

  describe "double toggle" do
    before(:each) do
      2.times do
        @theme_toggle.click
      end
    end
    it_should_behave_like "theme", "dark"
    it "should have a dark background" do
      color = page.evaluate_script("window.getComputedStyle(document.body).backgroundColor")
      expect(@dark_backgrounds).to include(color)
    end
    it "should have a default-dark js-tree theme" do
      expect(page).to have_css("#projects-tree.jstree-default-dark")
    end
  end
end
