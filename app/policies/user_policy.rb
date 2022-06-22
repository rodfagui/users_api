class UserPolicy < ApplicationPolicy
  def index?
    user.has_permission?('list_userss')
  end
end
