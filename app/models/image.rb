class Image < ApplicationRecord
    belongs_to :user
    has_many :cv_templates, dependent: :nullify

    validates :title, presence: true
    validates :image, presence: true
    # validate :image_size_validation # dropped because it takes too damn long company to the carrierwave inbuilt version
    before_destroy :clear_s3

    mount_uploader :image, ImageUploader

    private

    def image_size_validation
        errors.add(:image, 'must be less than 5MB') if image.size > 5.megabytes
    end

    def clear_s3
        path = "cvmaker/uploads/images/image/#{id}"
        # clear s3 folder. might need to move this to a worker later
        s3 = Aws::S3::Bucket.new(ENV['S3_BUCKET'])
        s3.objects({ prefix: path }).batch_delete!
        true
    rescue Timeout::Error => e
        errors.add(:base, 'Oops. We were not able to delete the files from our servers. Please try again in now or later.')
        Rails.logger.fatal("Errors while deleting files on s3. Exception: #{e}")
        false
    end
end
