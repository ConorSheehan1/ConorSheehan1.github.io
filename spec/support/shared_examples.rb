# frozen_string_literal: true

shared_examples 'base' do
  it 'should have a link to the homepage' do
    home_page_xpath = "//h1/a[text()='Conor Sheehan']"
    expect(page).to have_xpath(home_page_xpath)
    home_page_link = page.find(:xpath, home_page_xpath)
    expect(home_page_link[:href].to_s).to match @home_page_regex
  end

  it 'should have a header with social links' do
    header_css = '#header'
    expect(page).to have_css(header_css)
    social_links = ['GitHub', 'Linked In', 'Stack Overflow']
    header_text = page.find(:css, header_css).text
    social_links.each { |l| expect(header_text).to include(l) }
  end

  it 'should have a footer with the theme link' do
    theme_link_xpath = "//div[@id='credit-footer']//a"
    footer_links = page.find_all(:xpath, theme_link_xpath)
    expect(footer_links[0][:href]).to eq @theme_github_link
    expect(footer_links[1][:href]).to eq @theme_twitter_link
  end

  it 'should have a projects search option' do
    expect(page).to have_css('#projects-search-input')
    expect(page).to have_css('.jstree-icon')
  end
end

shared_examples_for 'theme' do |theme|
  it 'should have the theme' do
    theme_xpath = "//html[contains(@class, '#{theme}')]"
    expect(page).to have_xpath(theme_xpath)
  end
end