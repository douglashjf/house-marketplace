class Offer < ApplicationRecord
  after_validation :set_defaults

  CATEGORY = %w[pending accepted declined].freeze
  belongs_to :user
  belongs_to :house
  validates :price, numericality: { only_integer: true, greater_than: 0 }, presence: true

  private
  def set_defaults
    status = "pending"
  end
end
