class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :mesure

  acts_as_votable
end
