def sign_in(user=nil)
  user ||= Fabricate(:user)
  visit log_in_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

def create_business(attributes)
  fill_in 'Title', with: attributes[:title]
  fill_in 'Description', with: attributes[:description]
  fill_in 'Location', with: attributes[:location]
  fill_in 'Phone number', with: attributes[:phone_number]
  click_button 'Create'
end