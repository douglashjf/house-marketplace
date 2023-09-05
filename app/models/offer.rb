class Offer < ApplicationRecord
  after_validation :set_defaults

  CATEGORY = %w[Pending Accepted Declined].freeze
  belongs_to :user
  belongs_to :house

  before_save :check_status_change

  validates :price, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validate :offer_price_greater_than_house_price

  private
  def set_defaults
    status = "Pending"
  end

  def offer_price_greater_than_house_price
    if price.present? && price <= house.price
      errors.add(:price, "must be greater than the Minimum Ask Price")
    end
  end

  def check_status_change
    if status_changed? && status == 'Accepted'
      pending_offers = house.offers.where(status: "Pending")
      pending_offers.update_all(status: "Declined") unless pending_offers.empty?
    end
  end
end
