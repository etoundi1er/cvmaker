class Recommendation < ApplicationRecord
    belongs_to :user
    belongs_to :cv_template

    validates :name, :profession, :company, presence: true

    def phone_and_email
        [phone, email].compact.join(' - ').to_s
    end

    def profession_and_company
        [profession, company].compact.join(', ').to_s
    end
end
