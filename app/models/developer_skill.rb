class DeveloperSkill < ApplicationRecord
  belongs_to :developer
  belongs_to :skill

  validates :points, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
