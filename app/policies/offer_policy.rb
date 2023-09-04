class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def destroy?
    owner_of_record_house = record.house.user == user
    record.user == user || owner_of_record_house
  end
end
