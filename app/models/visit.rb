class Visit < ApplicationRecord
    belongs_to :patient

    before_create :set_visit_date

    validates :visit_date, presence: true

    scope :on_date, ->(date) { where(visit_date: date) }
    scope :this_month, ->(date) {
        where(visit_date: date.beginning_of_month..date.end_of_month)
    }

    scope :active, -> { where(deleted_at: nil) }

    private

    def set_visit_date
        self.visit_date = Date.current
    end
end
