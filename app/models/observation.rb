class Observation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  acts_as_votable
end
