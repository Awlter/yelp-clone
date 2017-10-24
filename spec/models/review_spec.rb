require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :business }

  describe "scope recent_ones" do
    it 'returns reviews with the the most recent one at top' do
      user = Fabricate(:user)
      business = Fabricate(:business)

      review1 = Fabricate(:review, user: user, business: business)
      review2 = Fabricate(:review, user: user, business: business)

      expect(Review.recent_ones).to eq [review2, review1]
    end
  end
end
