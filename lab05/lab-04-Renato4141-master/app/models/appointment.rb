class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  has_many :treatments

  enum :status, {
    scheduled: 0,
    completed: 1,
    cancelled: 2
  }
end
