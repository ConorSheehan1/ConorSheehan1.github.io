require "faraday"

describe "home page", type: :feature, js: true do

  it "has a title" do
    visit '/'
    # `binding.pry` is useful for crafting the right selector
    # or checking the actual state of the page
    # binding.pry # test will pause here
    expect(page).to have_title "Conor Sheehan"
  end

  it "returns ok for all links" do
    visit '/'
    within("#header") do
      all('a').each do |link|
        http_status = Faraday.head(link[:href].to_s).status
        puts "#{link.text}, #{http_status}"
        # linked in returns 999 code (possibly filter by user agent)
        # to account for redirects and cases where bots are refused, 
        # only check for typical client and server side errors
        expect((400..500)).not_to include(http_status) 
      end
    end
  end

end
