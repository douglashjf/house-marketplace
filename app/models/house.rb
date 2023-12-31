class House < ApplicationRecord
  TENURE_CAT = ["99-Years", "999-Years", "Freehold"]
  BEDROOM = [1, 2, 3, 4, 5]
  BATHROOM = [1, 2, 3, 4, 5]
  PROPERTY_TYPE = ["HDB", "Condo", "Landed"]

  # pg search
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: :address,
    using: {
      tsearch: { prefix: true }
    }

  def favourited_by?(user)
    user.favourites.exists?(id)
  end

  belongs_to :user
  validates :address, :price, :bedroom, :bathroom, :square_feet, :description, :property_type, :tenure, presence: true
  validates :bedroom, :bathroom, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :price, :square_feet, numericality: { only_integer: true, greater_than: 0 }
  has_many :offers, dependent: :destroy
  # cloudinary images
  has_many_attached :photos
  # favourites feature
  has_many :favourites, dependent: :destroy
  # geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # check that region exists from geocoder result
  validates :region, presence: true
end
