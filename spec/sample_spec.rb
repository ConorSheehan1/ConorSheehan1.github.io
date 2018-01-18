require "faraday"

describe "home page", type: :feature, js: true do

  it "has a title" do
    visit '/'
    expect(page).to have_title "Conor Sheehan"
  end

  it "does not throw 400/500 error for any link" do
    visit '/'
    within(".wrapper") do
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

  it "does throw 400/500 error for url which fails" do
    http_status = Faraday.head("https://en.wikipedia.org/__wiki_/").status
    expect((400..500)).to include(http_status)
  end    

end
