class Experience < ApplicationRecord
    belongs_to :user
    belongs_to :cv_template

    validates :position, :company, :location, :start_date, :end_date, presence: true

    before_validation :check_end_date

    private

    def check_end_date
        self.end_date = end_date.presence || 'Present'
    end
end
