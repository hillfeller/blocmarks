class LikePolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve

        scope.all
    end
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && record.user == user
  end
end
