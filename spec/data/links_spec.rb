# frozen_string_literal: true

describe "links data file", type: :data, allow_failure: true do
  context "when the data is loaded" do
    # Dir.pwd will be root of this project since rspec must be run from root
    YAML.load_file("#{Dir.pwd}/_data/links.yml").each do |link_name, href|
      # linkedin returns 999 code (possibly filter by user agent)
      # to account for redirects and cases where bots are refused,
      # only check for typical client and server side errors
      it "#{link_name} href should not throw a 400/500 error" do
        expect((400..599)).not_to include(Faraday.head(href).status)
      end
    end
  end
end
