class User < ApplicationRecord
  has_secure_password
  has_secure_token

  enum role: [:user, :admin]

  validates :login, :password, presence: true
  validates :login, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
