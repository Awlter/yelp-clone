require 'rails_helper'

RSpec.feature "Businesses", type: :feature do
  scenario 'create a business' do
    visit root_path

    expect(page).to_not have_content 'Add a business'

    user = Fabricate(:user)
    visit log_in_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content 'Add a business'

    click_link 'Add a business'

    business_attributes = Fabricate.attributes_for(:business)
    fill_in 'Title', with: business_attributes[:title]
    fill_in 'Description', with: business_attributes[:description]
    fill_in 'Location', with: business_attributes[:location]
    fill_in 'Phone number', with: business_attributes[:phone_number]
    click_button 'Create'

    expect(page).to have_content business_attributes[:title]
  end
end
