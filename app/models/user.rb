class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :role_permissions, through: :roles, source: :permissions

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  def has_permission?(action)
    permission = Permission.find_by(action: action)
    permission.present? ? role_permissions.include?(permission) : false
  end
end
