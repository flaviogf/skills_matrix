class User < ApplicationRecord
  validates :email, presence: true, email: true, uniqueness: true

  has_secure_password
end
