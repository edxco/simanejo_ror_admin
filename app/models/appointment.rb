class Appointment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  belongs_to :instructor

  validates :student, presence: true

  scope :paid_out, -> { where(status: 'Pagado') }
  scope :to_be_paid, -> { where(status: 'Por pagar') }

end