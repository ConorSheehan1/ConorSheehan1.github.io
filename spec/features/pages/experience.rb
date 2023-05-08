# frozen_string_literal: true

describe "home page", type: :feature, js: true do
  before(:each) do
    visit "/"
  end

  include_examples "base"

  it "should have a title" do
    expect(page).to have_title "Experience"
  end

  # TODO: make this shared context/example with params for id and str?
  it "should list experience" do
    expect(page).to have_css("#experience")
    expect(page.find("#experience").text).to eq "Experience"
  end
end
