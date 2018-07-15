# frozen_string_literal: true

describe 'home page', type: :feature, js: true do
  before(:each) do
    visit '/projects'
    @pagination_num = 3
  end

  include_examples 'base'

  it "should display #{@pagination_num} projects per page" do
    expect(page.all('.post-link').count).to eq @pagination_num
  end
end
