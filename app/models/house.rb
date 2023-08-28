class House < ApplicationRecord
  TENURE_CAT = ["99-year", "999-year", "freehold"]
  BEDROOM = [1, 2, 3, 4, 5]
  BATHROOM = [1, 2, 3, 4, 5]
  PROPERTY_TYPE = ["HDB", "Condo", "Landed"]

  belongs_to :user
  validates :address, :price, :bedroom, :bathroom, :square_feet, :description, :property_type, :tenure, presence: true
  validates :bedroom, :bathroom, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :price, :square_feet, numericality: { only_integer: true, greater_than: 0 }
  has_many :offers, dependent: :destroy
  has_one_attached :photo
end
