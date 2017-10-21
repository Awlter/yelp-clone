Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  password { Faker::Lorem.characters(10) }
  email { Faker::Internet.email }
end