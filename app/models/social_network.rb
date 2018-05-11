class SocialNetwork < ApplicationRecord
    belongs_to :user
    belongs_to :cv_template

    validates :url, :title, :username, presence: true, uniqueness: { scope: :cv_template_id }
end
