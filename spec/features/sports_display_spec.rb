require 'rails_helper'

feature 'sports displayment' do

  before(:all) do
    Capybara.current_driver = :selenium
  end

  it 'user access to the site', js: true do
    visit '/'

    wait_for_ajax
    
    expect(page).to have_text("Football")
  end
end
