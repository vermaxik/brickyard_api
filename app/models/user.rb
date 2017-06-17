class User < ApplicationRecord
  has_secure_password

  enum role: [:user, :admin]

  validates :login, :password, presence: true
  validates :login, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
