class Course < ApplicationRecord
  has_many :appointments
  has_many :instructors, through: :appointments
  has_many :students, through: :appointments
  
  validates :course_name, presence: true, uniqueness: true
  validates :course_cost, presence: true, numericality: { only_integer: true, greater_than: 200  }
  validates :course_hours, presence: true, numericality: { only_integer: true, greater_than: 0 }
end