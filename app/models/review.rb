class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business

  scope :recent_ones, -> { order('created_at DESC') }
end