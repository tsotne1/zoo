class Category < ApplicationRecord
  has_many :aniaml_categories
  has_many :animals, through: :animal_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end
