require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it 'responses successfully' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    context "with valid inputs" do
      let(:user_params) { Fabricate.attributes_for(:user) }

      it "adds a user" do
        expect {
          post :create, params: { user: user_params }
        }.to change(User.all, :count).by(1)
      end

      it "redirects to businesses path" do
        post :create, params: { user: user_params }
        expect(response).to redirect_to businesses_path
      end

      it "sets the flash['notice']" do
        post :create, params: { user: user_params }
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid inputs" do
      let(:invalid_user_params) { Fabricate.attributes_for(:user, password: nil) }
      it 'does not add a user' do
        expect {
          post :create, params: { user: invalid_user_params }
        }.to change(User.all, :count).by(0)
      end

      it "sets the flash['error']" do
        post :create, params: { user: invalid_user_params }
        expect(flash[:error]).to be_present
      end
    end
  end

  describe '#show' do
    it 'responses successfully' do
      user = Fabricate(:user)
      get :show, params: { id: user.slug }
      expect(response).to be_success
    end
  end
end
