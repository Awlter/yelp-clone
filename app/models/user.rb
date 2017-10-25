class User < ApplicationRecord
  has_many :businesses
  has_many :reviews

  validates_presence_of :first_name, :last_name, :password, :email
  validates_uniqueness_of :email

  has_secure_password

  def full_name
    first_name + ' ' + last_name
  end
end