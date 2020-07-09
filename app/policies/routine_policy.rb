class RoutinePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
