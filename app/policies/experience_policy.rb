class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create?
  end

  def create?
    return user.ngo
  end

  def edit?
    record.user_id == user.id
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end

