module Frontend
    class CvTemplatesController < FrontendController
        before_action :set_user
        before_action :set_cv_template, except: %i[index new create]

        def index
            @cv_templates = @user.cv_templates.all
        end

        def show; end

        def edit; end

        def new
            @cv_template = @user.cv_templates.new
        end

        def create
            @cv_template = @user.cv_templates.new(cv_template_params)
            if @cv_template.save
                redirect_to edit_cv_template_path(@cv_template, step: 'personal')
            else
                flash.now[:alert] = @cv_template.errors.full_messages.to_sentence
                render :new
            end
        end

        def update
            if @cv_template.update(cv_template_params)
                next_step = case params[:step]
                            when 'basics'
                                'personal'
                            when 'personal'
                                'social'
                            end

                redirect_to edit_cv_template_path(@cv_template, step: next_step)
            else
                flash.now[:alert] = @cv_template.errors.full_messages.to_sentence
                render :edit
            end
        end

        def destroy
            if @cv_template.destroy
                redirect_to root_path, notice: 'CV deleted.'
            else
                redirect_to cv_template_path(@cv_template), alert: @cv_template.errors.full_messages.to_sentence
            end
        end

        private

        def set_user
            @user = current_user
        end

        def set_cv_template
            @cv_template = @user.cv_templates.find(params[:id])
        end

        def cv_template_params
            params.require(:cv_template).permit(:title, :description, :firstname, :lastname, :profession, :phone, :email, :website, :address, :image_id)
        end
    end
end
