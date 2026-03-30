class Patient < ApplicationRecord
    has_many :visits, dependent: :destroy
    has_many :appointments, dependent: :destroy
    scope :active, -> { where(deleted_at: nil) }
end
