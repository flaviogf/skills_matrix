class Role < ApplicationRecord
  ADMIN = 1
  STAFF = 2

  has_many :users

  scope :admin, -> { find(ADMIN) }

  scope :staff, -> { find(STAFF) }
end
