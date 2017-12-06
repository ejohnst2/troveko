class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    record.user_id == user.id
  end

  def destroy?
    update?
  end

  def cancel?
    update?
  end
end
