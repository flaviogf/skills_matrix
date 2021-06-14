class Developer < ApplicationRecord
  has_many :developer_skills, dependent: :destroy
  has_many :skills, through: :developer_skills

  validates :email, presence: true, email: true, uniqueness: true

  accepts_nested_attributes_for :developer_skills
end
