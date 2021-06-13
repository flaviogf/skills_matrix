class User < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  has_secure_password
end
