class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def update?
    owner_of_record_house = record.house.user == user
    record.user == user || owner_of_record_house
  end

  def destroy?
    owner_of_record_house = record.house.user == user
    record.user == user || owner_of_record_house
  end

  def accept?
    true
  end

  def decline?
    true
  end
end
