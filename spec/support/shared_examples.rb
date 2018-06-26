shared_examples 'base' do
  it 'should have a link to the homepage' do 
    home_page_xpath = "//h1/a[text()='Conor Sheehan']"
    expect(page).to have_xpath(home_page_xpath)
    home_page_link = page.find(:xpath, home_page_xpath)
    expect(home_page_link[:href].to_s).to match /http\:\/\/127\.0\.0\.1\:(\d+)\//
  end

  it 'should have a header with social links' do
    header_css = "#header"
    expect(page).to have_css(header_css)
    social_links = ['GitHub', 'Linked In', 'Stack Overflow']
    header_text = page.find(:css, header_css).text
    social_links.each { |l| expect(header_text).to include(l) }
  end
end
