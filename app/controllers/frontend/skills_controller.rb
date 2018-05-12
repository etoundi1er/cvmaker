module Frontend
    class SkillsController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_skill, only: %i[update destroy]

        def new
            @skill = @user.skills.new(cv_template: @cv_template)
        end

        def create
            @skill = @user.skills.new(skill_params)
            if @skill.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @skill.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @skill.update(skill_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @skill.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @skill.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @skill.errors.full_messages.to_sentence
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

        def set_skill
            @skill = @cv_template.skills.find(params[:id])
        end

        def skill_params
            params.require(:skill).permit(:cv_template_id, :name, :level)
        end
    end
end
