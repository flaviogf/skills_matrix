class Skill < ApplicationRecord
  has_many :developer_skills, dependent: :destroy
  has_many :developers, through: :developer_skills

  validates :name, presence: true
end
