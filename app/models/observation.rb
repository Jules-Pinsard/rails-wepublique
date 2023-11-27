class Observation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  acts_as_votable

  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :dangerosity, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
