Fabricator(:review) do
  user
  business
  rating      { (1..5).to_a.sample }
  content     { Faker::Lorem.paragraphs(2).join }
end
