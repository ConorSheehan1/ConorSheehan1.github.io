describe "home page", type: :feature, js: true do
  before(:each) do
    visit '/projects'
  end

  include_examples 'base'

end

