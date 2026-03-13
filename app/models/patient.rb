class Patient < ApplicationRecord
    has_many :visits, dependent: :destroy
end
