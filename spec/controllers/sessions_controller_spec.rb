require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'responses successfully' do
      get :new
      expect(response).to be_success
    end
  end
end
