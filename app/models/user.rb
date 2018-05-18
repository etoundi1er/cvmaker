class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :certifications, dependent: :destroy
    has_many :cv_templates, dependent: :destroy
    has_many :educations, dependent: :destroy
    has_many :experiences, dependent: :destroy
    has_many :images, dependent: :destroy
    has_many :languages, dependent: :destroy
    has_many :recommendations, dependent: :destroy
    has_many :social_networks, dependent: :destroy
    has_many :skills, dependent: :destroy

    after_commit :create_dummy_cv, on: :create

    def create_dummy_cv
        Concerns::DummyData.new(self).create_data
    end
end
