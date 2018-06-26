# frozen_string_literal: true

describe 'home page', type: :feature, js: true do
  before(:each) do
    visit '/projects'
  end

  include_examples 'base'

  xit 'should paginate projects' do
  end

  xit 'should '
end
