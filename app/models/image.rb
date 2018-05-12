class Image < ApplicationRecord
    belongs_to :user
    has_many :cv_templates, dependent: :nullify

    validates :title, presence: true
    validates :image, presence: true
    # validate :image_size_validation # dropped because it takes too damn long company to the carrierwave inbuilt version

    mount_uploader :image, ImageUploader

    private

    def image_size_validation
        errors.add(:image, 'must be less than 5MB') if image.size > 5.megabytes
    end
end
