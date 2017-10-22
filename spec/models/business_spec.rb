require 'rails_helper'

RSpec.describe Business, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :reviews }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :location }
  it { is_expected.to validate_presence_of :phone_number }
end
