class Instructor < ApplicationRecord
  has_many :appointments
  has_many :courses, through: :appointments
  has_many :students, through: :appointments

  validates :instructor_name, presence: true
  validates :instructor_last_name, presence: true
  validates :vehicle_brand, presence: true
  validates :vehicle_model, presence: true
  validates :transmission, presence: true
  validates :plate_number, presence: true
  validates :car_color, presence: true
  validates :phone_number, presence: true, length: { minimum: 2 }
end