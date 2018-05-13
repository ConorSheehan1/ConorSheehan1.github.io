require "faraday"

describe "home page", type: :feature, js: true do

  it "has a title" do
    visit '/'
    expect(page).to have_title "Conor Sheehan"
  end

  it "does not throw 400/500 error for any link" do
    visit '/'
    within(".wrapper") do
      exclude_links = ['more','View Source on GitHub']
      links = all('a').select {|l| !exclude_links.any? { |word| l.text.include?(word) }}
      
      links.each do |link|
        http_status = Faraday.head(link[:href].to_s).status
        puts "#{link.text}, #{http_status}"
        # linkedin returns 999 code (possibly filter by user agent)
        # to account for redirects and cases where bots are refused, 
        # only check for typical client and server side errors
        expect((400..500)).not_to include(http_status) 
      end
    end
  end

end
