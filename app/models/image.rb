class Image < ApplicationRecord
    belongs_to :user
    has_many :cv_templates, dependent: :nullify
end
