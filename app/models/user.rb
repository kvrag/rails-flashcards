class User < ApplicationRecord
  has_many :rounds

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /.+@\D*\.\D{3}\z/ }
  validates :password, length: { minimum: 6 }, allow_nil: false

  has_secure_password

end
