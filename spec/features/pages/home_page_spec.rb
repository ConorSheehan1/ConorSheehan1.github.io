# frozen_string_literal: true

describe "home page", type: :feature, js: true do
  before(:each) do
    visit "/"
  end

  include_examples "base"

  it "should have a title" do
    expect(page).to have_title "Conor Sheehan"
  end

  # TODO: make this hsared context/example with params for id and str?
  it "should list experience" do
    expect(page).to have_css("#experience")
    expect(page.find("#experience").text).to eq "Experience"
  end
  it "should list what I can do" do
    expect(page).to have_css("#what-i-can-do")
    expect(page.find("#what-i-can-do").text).to eq "What I can do"
  end
  it "should list what I'm interested it" do
    expect(page).to have_css("#what-im-interested-in")
    txt = "What I’m interested in"
    expect(page.find("#what-im-interested-in").text).to eq txt
  end
end
