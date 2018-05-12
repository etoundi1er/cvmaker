module Frontend
    class EducationsController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_education, only: %i[update destroy]

        def new
            @education = @user.educations.new(cv_template: @cv_template)
        end

        def create
            @education = @user.educations.new(education_params)
            if @education.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @education.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @education.update(education_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @education.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @education.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @education.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        private

        def set_user
            @user = current_user
        end

        def set_cv_template
            @cv_template = @user.cv_templates.find(params[:cv_template_id])
        end

        def set_education
            @education = @cv_template.educations.find(params[:id])
        end

        def education_params
            params.require(:education).permit(:cv_template_id, :courses, :academy, :location, :start_date, :end_date, :summary)
        end
    end
end
