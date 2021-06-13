class Developer < ApplicationRecord
  validates :email, presence: true, email: true, uniqueness: true
end
