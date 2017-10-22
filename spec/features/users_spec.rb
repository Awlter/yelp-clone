require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'user creates an account' do
    visit register_path

    user_params = Fabricate.attributes_for(:user)

    fill_in 'Email', with: user_params[:email]
    fill_in 'Password', with: user_params[:password]
    fill_in 'First name', with: user_params[:first_name]
    fill_in 'Last name', with: user_params[:last_name]

    click_button 'Sign Up'
    expect(page).to have_content 'Created an account successfully!'
  end
end
