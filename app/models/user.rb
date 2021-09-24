class User < ApplicationRecord
  before_save  { self.username_email = username_email.downcase }

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :username_email, presence: true, 
                  uniqueness: { case_sensitive: false }, 
                  format: { with: VALID_EMAIL_REGEX, on: :create }
  has_secure_password
end