class Student < ApplicationRecord
  before_save  { self.email = email.downcase }
  before_save  { self.student_name = student_name.split.map(&:capitalize)*' ' }
  before_save  { self.last_name = last_name.split.map(&:capitalize)*' ' }
  before_save  { self.street = street.split.map(&:capitalize)*' ' }
  
  has_many :appointments
  has_many :courses, through: :appointments
  has_many :instructors, through: :appointments

  validates :student_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates :street, presence: true
  validates :address, presence: true
  validates :city, presence: true
  # validates :hours, presence: true, numericality: { only_integer: true, greater_than: 0 }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, 
                  uniqueness: { case_sensitive: false }, 
                  format: { with: VALID_EMAIL_REGEX, on: :create }

  def full_name
    "#{self.student_name} #{self.last_name}"
  end

  def downcase_fields
    self.name.split.map(&:capitalize)*' '
  end

  scope :search_in_full_name, ->(query) { where("last_name ~ ? or student_name ~ ?", query, query) }

end