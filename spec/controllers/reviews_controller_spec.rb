require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe '#index' do
    it 'responses successfully' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:user) { Fabricate(:user) }
    let(:business) { Fabricate(:business, user: user) }
    let(:review_attributes) { Fabricate.attributes_for(:review) }

    context 'as an authorized user' do
      before do
        session[:user_id] = user.id
      end

      it 'adds a new review' do
        expect {
          post :create, params: { business_id: business.slug, review: review_attributes }
        }.to change(Review.all, :count).by(1)
      end

      it 'redirects to the business show page' do
        post :create, params: { business_id: business.slug, review: review_attributes }
        expect(response).to redirect_to business_path(business)
      end
    end

    context 'as a guest' do
      it 'redirects to root path' do
        post :create, params: { business_id: business.id, review: review_attributes }
        expect(response).to redirect_to root_path
      end
    end
  end
end
