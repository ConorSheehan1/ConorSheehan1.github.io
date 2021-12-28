# frozen_string_literal: true

# projects search is available on all pages with a header
# but just test that it works rather than checking every page
describe 'theme toggle', type: :feature, js: true do
  # before(:all) do
  #   visit '/'
  # end

  before(:each) do
    visit '/'
    # need to clean local storage to ensure correct default theme state
    page.execute_script "window.localStorage.setItem('theme', 'dark');"
    page.driver.browser.navigate.refresh
    @theme_toggle = page.find(:css, '#theme-toggle')
    @dark_background = 'rgba(37, 37, 37, 1)' # 252525
    @light_background = 'rgba(242, 242, 242, 1)' # f2f2f2
  end

  describe 'initial page load' do
    it_should_behave_like 'theme', 'dark'
    it 'should have a dark background' do
      color = page.find('body').native.css_value('background-color')
      expect(color).to eq @dark_background
    end
    it 'should have a default-dark js-tree theme' do
      expect(page).to have_css('#projects-tree.jstree-default-dark')
    end
  end

  describe 'single toggle' do
    before { @theme_toggle.click }
    it_should_behave_like 'theme', 'light'
    it 'should have a light background' do
      color = page.find('body').native.css_value('background-color')
      expect(color).to eq @light_background
    end
    it 'should have a default js-tree theme' do
      expect(page).to have_css('#projects-tree.jstree-default')
    end
  end

  describe 'double toggle' do
    before(:each) do
      2.times do
        @theme_toggle.click
      end
    end
    it_should_behave_like 'theme', 'dark'
    it 'should have a dark background' do
      color = page.find('body').native.css_value('background-color')
      expect(color).to eq @dark_background
    end
    it 'should have a default-dark js-tree theme' do
      expect(page).to have_css('#projects-tree.jstree-default-dark')
    end
  end
end
