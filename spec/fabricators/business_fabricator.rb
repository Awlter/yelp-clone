Fabricator(:business) do
  title { Faker::Lorem.characters(8) }
  description { Faker::Lorem.characters(20) }
  location { Faker::Lorem.characters(8) }
  phone_number { Faker::PhoneNumber.phone_number }
end
