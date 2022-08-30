class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    @user.has_role? :teacher
  end

  def create?
    @user.has_role? :teacher
  end

  def edit?
    return (@user.has_role?:admin or @record.user == @user) if @user
    false
  end

  def update?
    return (@user.has_role?:admin or @record.user == @user) if @user
    false
  end

  def destroy?
    return (@user.has_role?:admin or @record.user == @user) if @user
    false
  end
end
