class Owner < ApplicationRecord
    has_many :pets

    def normalize_email:
        self.email = email.to_s.downcase.strip
    end

    before validation :normalize_email

    validates :name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
