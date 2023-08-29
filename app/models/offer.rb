class Offer < ApplicationRecord
  after_validation :set_defaults

  CATEGORY = %w[pending accepted declined].freeze
  belongs_to :user
  belongs_to :house
  validates :price, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validate :higher_than_min_price, on: :create

  private
  def set_defaults
    status = "pending"
  end

  def higher_than_min_price
    if price.present? && price < house.price
      errors.add(:price, "must be higher than the house price")
    end
  end
end
