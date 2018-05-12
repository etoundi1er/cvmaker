class ImageUploader < CarrierWave::Uploader::Base
    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    # storage :file
    storage :fog

    def initialize(*)
        super
        self.fog_public = true
        self.fog_attributes = { cache_control: 'max-age=5184000', expires: 1.year.from_now.httpdate }
    end

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
        "cvmaker/uploads/images/#{mounted_as}/#{model.id}"
    end

    def fix_exif_rotation
        manipulate! do |img|
            img.tap(&:auto_orient)
        end
    end

    process :fix_exif_rotation

    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url(*args)
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end

    # Process files as they are uploaded:
    # process scale: [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end

    # Create different versions of your uploaded files:
    version :thumb do
        process resize_to_fit: [200, 200]
    end

    version :medium do
        process resize_to_fit: [500, 500]
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_whitelist
        %w[jpg jpeg gif png]
    end

    def size_range
        0..5.megabytes
    end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end
end
