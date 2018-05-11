module Frontend
    class SocialNetworksController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_social_network, only: %i[update destroy]

        def new
            @social_network = @user.social_networks.new(cv_template: @cv_template)
        end

        def create
            @social_network = @user.social_networks.new(social_network_params)
            if @social_network.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @social_network.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @social_network.update(social_network_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @social_network.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @social_network.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @social_network.errors.full_messages.to_sentence
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

        def set_social_network
            @social_network = @cv_template.social_networks.find(params[:id])
        end

        def social_network_params
            params.require(:social_network).permit(:cv_template_id, :title, :username, :url)
        end
    end
end
