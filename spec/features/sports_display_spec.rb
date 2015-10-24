require 'rails_helper'

feature 'sports displayment' do
  scenario 'user access to the site' do
    visit root_path

    expect(page).to have_text("Football")
  end
end
