module Frontend
    class RecommendationsController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_recommendation, only: %i[update destroy]

        def new
            @recommendation = @user.recommendations.new(cv_template: @cv_template)
        end

        def create
            @recommendation = @user.recommendations.new(recommendation_params)
            if @recommendation.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @recommendation.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @recommendation.update(recommendation_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @recommendation.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @recommendation.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @recommendation.errors.full_messages.to_sentence
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

        def set_recommendation
            @recommendation = @cv_template.recommendations.find(params[:id])
        end

        def recommendation_params
            params.require(:recommendation).permit(:cv_template_id, :name, :profession, :company, :phone, :email)
        end
    end
end
