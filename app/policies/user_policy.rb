class UserPolicy < ApplicationPolicy
  def index?
    user.has_permission?('list_users')
  end

  def show?
    user.has_permission?('show_users')
  end

  def create?
    user.has_permission?('create_users')
  end

  def update?
    user.has_permission?('update_users')
  end

  def destroy?
    user.has_permission?('destroy_users')
  end
end
