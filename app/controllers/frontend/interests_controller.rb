module Frontend
    class InterestsController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_interest, only: %i[update destroy]

        def new
            @interest = @user.interests.new(cv_template: @cv_template)
        end

        def create
            @interest = @user.interests.new(interest_params)
            if @interest.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @interest.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @interest.update(interest_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @interest.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @interest.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @interest.errors.full_messages.to_sentence
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

        def set_interest
            @interest = @cv_template.interests.find(params[:id])
        end

        def interest_params
            params.require(:interest).permit(:cv_template_id, :name)
        end
    end
end
