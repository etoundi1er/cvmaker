class Certification < ApplicationRecord
    belongs_to :user
    belongs_to :cv_template
end
