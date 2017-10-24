require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  scenario 'add a review to a business' do
    user = Fabricate(:user)
    business_attributes = Fabricate.attributes_for(:business)
    review_attributes = Fabricate.attributes_for(:review)

    sign_in(user)
    click_link 'Add a business'
    create_business(business_attributes)
    click_link business_attributes[:title]

    select(review_attributes[:rating], from: 'review_rating')
    fill_in 'review_content', with: review_attributes[:content]
    click_button 'Submit'

    expect(page).to have_content review_attributes[:content]
  end
end
