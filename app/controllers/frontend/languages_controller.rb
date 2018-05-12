module Frontend
    class LanguagesController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_language, only: %i[update destroy]

        def new
            @language = @user.languages.new(cv_template: @cv_template)
        end

        def create
            @language = @user.languages.new(language_params)
            if @language.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @language.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @language.update(language_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @language.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @language.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @language.errors.full_messages.to_sentence
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

        def set_language
            @language = @cv_template.languages.find(params[:id])
        end

        def language_params
            params.require(:language).permit(:cv_template_id, :name, :level)
        end
    end
end
