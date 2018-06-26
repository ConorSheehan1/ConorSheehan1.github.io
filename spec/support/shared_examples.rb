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
    # footer link is in div, in anchor, in paragraph
    # select paragraph by text, then get link as parent
    theme_link_xpath = "//div[@id='footer']//a" \
      "/p[text()='Theme by mattgraham']/parent::*"
    footer_link = page.find(:xpath, theme_link_xpath)
    expect(footer_link[:href]).to eq @theme_link
  end
end
