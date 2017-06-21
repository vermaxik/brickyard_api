class User < ApplicationRecord
  has_secure_password
  has_secure_token

  enum role: [:user, :admin]

  validates :login, presence: true
  validates :login, uniqueness: true
  validates :password,  confirmation: true, on: :create
  validates :password_confirmation, :password, presence: true, on: :create

  belongs_to :main

end
