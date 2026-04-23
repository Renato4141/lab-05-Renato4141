class Treatment < ApplicationRecord
  belongs_to :appointment

  validates :name, presence: true
  validates :name, administered_at, :appointment, presence: true
end
