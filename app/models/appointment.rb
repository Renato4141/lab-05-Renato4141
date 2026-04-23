class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  has_many :treatments

  enum :status, {
    scheduled: 0,
    completed: 1,
    cancelled: 2
  }
  validates :appointment_date, presence: true
  validates :status, presence: true
  validates :pet, presence: true
  validates :vet, presence: true
  validates :reason, presence: true
  
  scope :upcoming, -> { where("appointment_date >= ?", Date.today) }
  scope :past, -> { where("appointment_date < ?", Date.today) }
end
