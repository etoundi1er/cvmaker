class CvTemplate < ApplicationRecord
    belongs_to :user
    belongs_to :image, optional: true

    has_many :certifications, dependent: :destroy
    has_many :educations, dependent: :destroy
    has_many :experiences, dependent: :destroy
    has_many :languages, dependent: :destroy
    has_many :recommendations, dependent: :destroy
    has_many :social_networks, dependent: :destroy
    has_many :skills, dependent: :destroy

    validates :title, presence: true, uniqueness: { scope: :user_id }

    def fullname
        "#{firstname} #{lastname}".strip
    end
end
