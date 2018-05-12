class Skill < ApplicationRecord
    belongs_to :user
    belongs_to :cv_template

    validates :name, presence: true, uniqueness: { scope: :cv_template_id }
    validates :level, presence: true
end
