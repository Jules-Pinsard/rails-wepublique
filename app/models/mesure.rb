class Mesure < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  attr_accessor :sort_by, :order, :mayor

  acts_as_votable

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
end
