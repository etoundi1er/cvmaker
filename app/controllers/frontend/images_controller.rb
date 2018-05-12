module Frontend
    class ImagesController < FrontendController
        before_action :set_user

        def index
            @images = @user.images.all
        end

        def new
            @image = @user.images.new
        end

        def create
            @image = @user.images.new(image_params)
            if @image.save
                if params[:cv_template_id]
                    cv_template = @user.cv_templates.find_by(id: params[:cv_template_id])
                    return redirect_to edit_cv_template_path(cv_template, step: 'personal'), notice: 'Image uploaded.' if cv_template
                end
                redirect_to images_path, notice: 'Image uploaded.'
            else
                flash.now[:alert] = @image.errors.full_messages.to_sentence
                render :new
            end
        end

        def destroy
            @image = @user.images.find(params[:id])

            if @image.destroy
                redirect_to images_path, notice: 'Image deleted.'
            else
                flash.now[:alert] = @image.errors.full_messages.to_sentence
                render :index
            end
        end

        private

        def set_user
            @user = current_user
        end

        def image_params
            params.require(:image).permit(:title, :image, :remove_image, :image_cache)
        end
    end
end
