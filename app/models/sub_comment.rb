class SubComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  acts_as_votable

  validates :content, presence: true
end
