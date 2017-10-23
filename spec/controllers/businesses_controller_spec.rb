require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  describe "GET #new" do
    context "as an authorized user" do
      it 'responses successfully' do
        user = Fabricate(:user)
        session[:user_id] = user.id
        get :new
        expect(response).to be_success
      end
    end

    context "as a guest" do
      it 'redirects to root path' do
        get :new
        expect(response).to redirect_to root_path
      end

      it 'sets flash error message' do
        get :new
        expect(flash[:error]).to_not be_blank
      end
    end
  end

  describe "GET #index" do
    it 'responses successfully' do
      get :index
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context 'as an authorized user' do
      let(:user) { Fabricate(:user) }
      let(:business_attributes) { Fabricate.attributes_for(:business) }

      before do
        session[:user_id] = user.id
      end

      context 'with valid input' do
        it 'adds a new business' do
          expect {
            post :create, params: { business: business_attributes }
          }.to change(Business.all, :count).by(1)
        end

        it 'redirects to root path' do
          post :create, params: { business: business_attributes }
          expect(response).to redirect_to root_path
        end

        it 'sets flash notice message' do
          post :create, params: { business: business_attributes }
          expect(flash[:notice]).to_not be_blank
        end
      end

      context 'with invalid input' do
        before do
          business_attributes[:title] = nil
        end

        it 'does not add a new business' do
          expect {
            post :create, params: { business: business_attributes }
          }.to change(Business.all, :count).by(0)
        end

        it 'sets flash error message' do
          post :create, params: { business: business_attributes }
          expect(flash[:error]).to_not be_blank
        end
      end
    end

    context 'as a guest' do
      it 'redirects to root path' do
        business_attributes = Fabricate.attributes_for(:business)
        post :create, params: { business: business_attributes }
        expect(response).to redirect_to root_path
      end
    end
  end
end
