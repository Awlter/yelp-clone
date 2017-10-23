require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'responses successfully' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:user) { Fabricate(:user) }
    context 'with valid credentials' do
      before do
        post :create, params: { email: user.email, password: user.password }
      end

      it 'puts :user_id in the session' do
        expect(session[:user_id]).to eq user.id
      end

      it 'redirects to business index page' do
        expect(response).to redirect_to businesses_path
      end

      it 'sets flash[:notice]' do
        expect(flash[:notice]).to_not be_blank
      end
    end

    context 'with invalid credentials' do
      before do
        post :create, params: { email: user.email, password: Faker::Lorem.characters(11) }
      end

      it 'does not set :user_id for session' do
        expect(session[:user_id]).to be_nil
      end

      it 'sets flash error message' do
        expect(flash[:error]).to_not be_blank
      end
    end
  end

  describe 'GET #destroy' do
    let(:user) { Fabricate(:user) }
    context 'as the authoriazed user' do
      before do
        session[:user_id] = user.id
        get :destroy
      end

      it 'clears session user_id' do
        expect(session[:user_id]).to be_nil
      end

      it 'redirects to root path' do
        expect(response).to redirect_to businesses_path
      end

      it 'sets flash notice message' do
        expect(flash[:notice]).to_not be_blank
      end
    end
  end
end
