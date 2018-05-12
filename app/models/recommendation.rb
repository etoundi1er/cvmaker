class Recommendation < ApplicationRecord
    belongs_to :user
    belongs_to :cv_template

    validates :name, :profession, :company, presence: true
end
