require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :businesses }
  it { is_expected.to have_many :reviews }

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_uniqueness_of :email }

  it "is valid with a first name, last name, email, and password" do
    user = Fabricate(:user)
    expect(user).to be_valid
  end

  describe "full_name" do
    it 'returns the full name of the user' do
      user = Fabricate(:user)
      expect(user.full_name).to eq(user.first_name + ' ' + user.last_name)
    end
  end

end
