class Visit < ApplicationRecord
    belongs_to :patient

    before_create :set_visit_date

    private

    def set_visit_date
        self.visit_date = Date.current
    end
end
