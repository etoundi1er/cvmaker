class Recommendation < ApplicationRecord
    belongs_to :user
    belongs_to :cv_template

    validates :name, :profession, presence: true

    def phone_and_email
        [phone.presence, email.presence].compact.join(' - ').to_s
    end

    def profession_and_company
        [profession.presence, company.presence].compact.join(', ').to_s
    end
end
