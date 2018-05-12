module Frontend
    class ExperiencesController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_experience, only: %i[update destroy]

        def new
            @experience = @user.experiences.new(cv_template: @cv_template)
        end

        def create
            @experience = @user.experiences.new(experience_params)
            if @experience.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @experience.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @experience.update(experience_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @experience.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @experience.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @experience.errors.full_messages.to_sentence
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

        def set_experience
            @experience = @cv_template.experiences.find(params[:id])
        end

        def experience_params
            params.require(:experience).permit(:cv_template_id, :position, :company, :location, :start_date, :end_date, :summary)
        end
    end
end
