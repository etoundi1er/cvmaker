module Frontend
    class AdminsController < FrontendController
        before_action :check_admin

        def index
            case params[:section]
            when 'cv_templates'
                @cv_templates = CvTemplate.includes(:user).order(:user_id, id: :desc).page(params[:page_cv_templates])
            when 'images'
                @images = Image.includes(:user).page(params[:page_images])
            else
                @users = User.includes(:cv_templates).page(params[:page_users])
            end
        end

        def destroy_user
            @user = User.find(params[:user_id])
            @user = User.find(params[:user_id])
            @user.destroy
        end

        def login_as_user
            sign_in(:user, User.find(params[:id]), { bypass: true })
            redirect_to root_url
        end

        private

        def check_admin
            redirect_to root_path, alert: 'Hold on right there champion. You cannot access this page' unless current_user.admin?
        end
    end
end
