class Offer < ApplicationRecord
  after_validation :set_defaults

  CATEGORY = %w[pending accepted declined].freeze
  belongs_to :user
  belongs_to :house
  validates :price, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validate :offer_price_greater_than_house_price, on: :create

  private
  def set_defaults
    status = "pending"
  end

  def offer_price_greater_than_house_price
    if price.present? && price <= house.price
      errors.add(:price, "must be greater than the Min price")
    end
  end
end
