class User < ApplicationRecord
  belongs_to :role

  validates :name, presence: true

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  has_secure_password

  def is_admin?
    role.id == Role::ADMIN
  end

  def is_staff?
    role.id == Role::STAFF
  end

  alias_method :admin, :is_admin?

  alias_method :staff, :is_staff?
end
