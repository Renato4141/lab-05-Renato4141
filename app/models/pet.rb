class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments

  def date_not_in_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end

  def capitalize_name
    self.name = name.to_s.capitalize
  end

  before_save :capitalize_name
  validates :name, presence: true
  validates :owner, presence: true
  validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other] }
  validates :breed, presence: true
  validates :date_of_birth, presence: true
  validate :date_not_in_future
  validates :weight, presence: true, numericality: { greater_than: 0 }

  scope :by_species, ->(species) { where(species: species) }



end
