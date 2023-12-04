class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :mesure
  has_many :sub_comments, dependent: :destroy

  acts_as_votable

  validates :content, presence: true
end
