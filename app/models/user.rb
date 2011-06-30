class User < ActiveRecord::Base
has_and_belongs_to_many :roles
# Determines whether or not a user has a role
#
# @param role Name of the role to search for
# @return [Boolean] True if the user has the specified role
def role?(role)
  return !!self.roles.find_by_name(role.to_s.camelize)
end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise  :database_authenticatable, :recoverable, :registerable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
attr_accessible :username
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validate :username_or_email_exists  
  
  # Used for validation.  Validates whether a username or email exists because one is required.
  def username_or_email_exists
    if username.blank? && email.blank?
      self.errors.add(:email, "or Username is required.")
    end
  end
  
  # Returns the user's email or username depending on which is set
  # @return [String] Return username unless it is blank, then return email
  def display_name
    return self.username.blank? ? self.email : self.username
  end

  class << self
    # Join to the user role habtm table that restricts output to super admins
    def superadmins
      joins("join roles_users on users.id = roles_users.user_id").where("roles_users.role_id = (select id from roles where name = 'SuperAdmin')");
    end
  end
end
