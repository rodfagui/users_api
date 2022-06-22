class ClientPolicy < ApplicationPolicy
  def index?
    user.has_permission?('list_clients')
  end

  def show?
    user.has_permission?('show_clients')
  end

  def create?
    user.has_permission?('create_clients')
  end

  def update?
    user.has_permission?('update_clients')
  end

  def destroy?
    user.has_permission?('destroy_clients')
  end
end
