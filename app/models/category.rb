class Category < ApplicationRecord
  has_many :mesures
  has_many :observations
end
