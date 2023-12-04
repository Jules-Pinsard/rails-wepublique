class User < ApplicationRecord
  has_many :mesures, dependent: :destroy
  has_many :observations, dependent: :destroy
  has_many :comments, through: :mesures
  has_many :sub_comments, through: :comments
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  validate :save_mayor?

  acts_as_voter

  before_save :capitalize
  after_create :set_mayor

  private

  def save_mayor?
    if self.code == "ExempleDeCode"
      return true
    elsif self.code.empty?
      return true
    else
      errors.add(:code, message: "invalide")
      return false
    end
  end

  def set_mayor
    if self.code == "ExempleDeCode"
      self.update(mayor: true)
    else
      self.update(mayor: false)
    end
  end

  def capitalize
    first_name.capitalize!
    last_name.capitalize!
  end
end
