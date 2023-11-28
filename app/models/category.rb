class Category < ApplicationRecord
  has_many :mesures
  has_many :observations

  # validates :name, inclusion: { in: %w[mobilier environnement sanité culture solidarité sport jeunesse finances
  #                                      patrimoine tourisme autre], message: `#{name} n'est pas une catégorie` }
end
