class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick

    storage :fog

    def initialize(*)
        super
        self.fog_public = true
        self.fog_attributes = { cache_control: 'max-age=5184000', expires: 1.year.from_now.httpdate }
    end

    def store_dir
        "cvmaker/images/#{model.try(:id)}"
    end

    version :thumb do
        process resize_to_fit: [300, 300], optimize: [quality: 80]
    end

    version :medium do
        process resize_to_fit: [750, 750], optimize: [quality: 80]
    end

    def extension_whitelist
        %w[jpg jpeg gif png]
    end
end
