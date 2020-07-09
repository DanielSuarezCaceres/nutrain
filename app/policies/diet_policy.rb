class DietPolicy < ApplicationPolicy
  attr_reader :user, :diet

  def initialize(user, diet)
    @user = user
    @diet = diet
  end

  class Scope < Scope
    def resolve
      if @user == user
        scope.all
      else
        raise Pundit::NotAuthorizedError, 'not allowed to view this action'
      end
    end
  end

  def index?
    #@diet.user_id == @user.id
  end

  def show?
    false
  end

  def create?
    #@diet.user_id == @user.id
  end

  def new?
    #create?
    #@diet.user_id == @user.id
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
