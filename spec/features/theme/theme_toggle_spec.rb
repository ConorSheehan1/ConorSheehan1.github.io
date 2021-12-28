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
  end

  describe 'initial page load' do
    it 'should set the dark theme' do
      theme_xpath = "//html[contains(@class, 'dark')]"
      expect(page).to have_xpath(theme_xpath)
    end
  end

  describe 'single toggle' do
    before { @theme_toggle.click }
    it 'should set the light theme' do
      theme_xpath = "//html[contains(@class, 'light')]"
      expect(page).to have_xpath(theme_xpath)
    end
  end

  describe 'double toggle' do
    before(:each) do
      2.times do
        @theme_toggle.click
      end
    end
    it 'should set the dark theme' do
      theme_xpath = "//html[contains(@class, 'dark')]"
      expect(page).to have_xpath(theme_xpath)
    end
  end
end