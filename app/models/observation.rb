class Observation < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  before_validation :get_location_with_coordinate

  belongs_to :user
  belongs_to :category

  acts_as_votable

  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :dangerosity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  private

  def get_location_with_coordinate
    self.location = Geocoder.search([latitude, longitude]) if location.nil?
  end
end
