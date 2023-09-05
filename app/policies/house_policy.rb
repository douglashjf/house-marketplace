class HousePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    # record_has_user_offer = record.offers.any? { |offer| offer.user == user }
    record.user == user
  end

  # offer policy
  # def update?
  #   owner_of_record_house = record.house.user == user
  #   record.user == user || owner_of_record_house
  # end

  def destroy?
    # record_has_user_offer = record.offers.any? { |offer| offer.user == user }
    record.user == user
  end

  def toggle_favourites?
    true
  end
end
