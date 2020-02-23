class Animal < ApplicationRecord
  belongs_to :user
  has_many :animal_categories
  has_many :categories, through: :animal_categories
  validates :name, presence: true, length: {minimum: 3, maxmimum: 50}
  validates :description, presence: true, length: {minimum: 3, maxmimum: 50}
  validates :user_id, presence: true

  def self.search(name)
    if name
      result = Animal.find_by(name: name)
    else
      nil
    end
  end
end
