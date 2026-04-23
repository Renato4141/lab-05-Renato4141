class Treatment < ApplicationRecord
  belongs_to :appointment

  validates :first_name, presence: true
  validates :last_name, presence: true``
  validates :administered_at, presence: true
  validates :appointment, presence: true
end