# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def arraify(object)
  if object.respond_to?(:each)
    object
  else
    [object]
  end
end

def set_roles_to_users(roles, emails)
  arraify(emails).each do |email|
    user = User.find_by_email(email)
    user.role_ids = Role.where(name: arraify(roles)).pluck(:id) if user.present?
  end
end

def set_permissions_to_roles(permissions, role_names)
  arraify(role_names).each do |role_name|
    role = Role.find_by_name(role_name)
    role.permission_ids = Permission.where(action: arraify(permissions)).pluck(:id) if role.present?
  end
end

User.create(
  name: 'Rodman Aguirre',
  username: 'rodfagui',
  email: 'rodfagui@gmail.com',
  password: '123456',
  password_confirmation: '123456'
) unless User.find_by_email('rodfagui@gmail.com').present?

Role.create(
  name: 'admin',
  description: 'Admin role'
) unless Role.find_by_name('admin').present?

Permission.create(
  action: 'sign_in',
  description: 'Permission to sign_in'
) unless Permission.find_by_action('sign_in').present?

Permission.create(
  action: 'list_users',
  description: 'Permission to list users'
) unless Permission.find_by_action('list_users').present?

Permission.create(
  action: 'create_users',
  description: 'Permission to create users'
) unless Permission.find_by_action('create_users').present?

Permission.create(
  action: 'show_users',
  description: 'Permission to show users'
) unless Permission.find_by_action('show_users').present?

Permission.create(
  action: 'update_users',
  description: 'Permission to update users'
) unless Permission.find_by_action('update_users').present?

Permission.create(
  action: 'destroy_users',
  description: 'Permission to destroy users'
) unless Permission.find_by_action('destroy_users').present?

Permission.create(
  action: 'list_clients',
  description: 'Permission to list clients'
) unless Permission.find_by_action('list_clients').present?

Permission.create(
  action: 'create_clients',
  description: 'Permission to create clients'
) unless Permission.find_by_action('create_clients').present?

Permission.create(
  action: 'show_clients',
  description: 'Permission to show clients'
) unless Permission.find_by_action('show_clients').present?

Permission.create(
  action: 'update_clients',
  description: 'Permission to update clients'
) unless Permission.find_by_action('update_clients').present?

Permission.create(
  action: 'destroy_clients',
  description: 'Permission to destroy users'
) unless Permission.find_by_action('destroy_clients').present?

Client.create(
  name: 'Alberto Perez',
  phone_number: '3045674321'
) unless Client.find_by_phone_number('3045674321').present?

set_roles_to_users(['admin'], ['rodfagui@gmail.com'])
set_permissions_to_roles(Permission.all.pluck(:action), ['admin'])
