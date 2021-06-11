class Role < ApplicationRecord
  ADMIN = 1
  STAFF = 2

  has_many :users

  def self.admin
    Role.find(ADMIN)
  end

  def self.staff
    Role.find(STAFF)
  end
end
