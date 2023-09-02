class Offer < ApplicationRecord
  after_validation :set_defaults

  CATEGORY = %w[pending accepted declined].freeze
  belongs_to :user
  belongs_to :house
  validates :price, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validate :offer_price_greater_than_house_price

  private
  def set_defaults
    status = "pending"
  end

  def offer_price_greater_than_house_price
    if price.present? && price <= house.price
      errors.add(:price, "must be greater than the Minimum Ask Price")
    end
  end
end
