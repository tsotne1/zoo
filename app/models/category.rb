class Category < ApplicationRecord
  has_many :animal_categories
  has_many :animals, through: :animal_categories
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates_uniqueness_of :name
end
