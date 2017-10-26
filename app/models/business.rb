class Business < ApplicationRecord
  include Sluggable

  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :description, :location, :phone_number

  sluggable_column :title
end