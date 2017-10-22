class Business < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :description, :location, :phone_number
end