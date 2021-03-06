require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  let(:user) { Fabricate(:user) }

  scenario 'sign in with invalid password' do
    visit log_in_path
    expect(page).to have_no_content 'Welcome'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: Faker::Lorem.characters(11)
    click_button 'Log in'

    expect(page).to have_no_content 'Welcome'
    expect(page).to have_content 'Log in'
  end

  scenario 'sign in with valid password' do
    visit log_in_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content "Welcome, #{user.full_name}"
    expect(page).to have_no_content 'Log in'
    expect(page).to have_no_content 'Sign up'
  end
end
