require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :business }

  describe "scope recent_ones" do
    it 'returns reviews with the the most recent one at top' do
      review1 = Fabricate(:review)
      review2 = Fabricate(:review)

      expect(Review.recent_ones).to eq [review2, review1]
    end
  end
end
