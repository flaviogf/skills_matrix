class User < ApplicationRecord
  belongs_to :role

  validates :name, presence: true

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  has_secure_password
end
