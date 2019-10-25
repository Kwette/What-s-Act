class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    return true
  end

  def index?
    return true
  end

  def confirmed?
    true
  end

  def decline?
    true
  end

  def cruise_filter?
    return true
  end
end
