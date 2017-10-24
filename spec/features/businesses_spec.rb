require 'rails_helper'

RSpec.feature "Businesses", type: :feature do
  scenario 'create a business' do
    visit root_path

    expect(page).to_not have_content 'Add a business'

    user = Fabricate(:user)
    sign_in(user)

    expect(page).to have_content 'Add a business'

    click_link 'Add a business'
    attributes = Fabricate.attributes_for(:business)
    create_business(attributes)

    expect(page).to have_content attributes[:title]
  end

  scenario 'access to a business page' do
    user = Fabricate(:user)
    sign_in(user)

    click_link 'Add a business'
    attributes = Fabricate.attributes_for(:business)
    create_business(attributes)

    click_link attributes[:title]
    expect(page).to have_content 'Write Review'
    expect(page).to have_content attributes[:phone_number]
  end
end
