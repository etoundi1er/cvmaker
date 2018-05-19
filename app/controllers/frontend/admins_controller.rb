module Frontend
    class AdminsController < FrontendController
        before_action :check_admin
        before_action :set_user, only: %i[show_user destroy_user]

        def index
            @users = User.includes(:cv_templates).all
            @cv_templates = CvTemplate.includes(:user).order(:user_id, id: :desc)
        end

        def show_user
            @user = User.find(params[:user_id])
        end

        def destroy_user
            @user = User.find(params[:user_id])
            @user.destroy
        end

        private

        def check_admin
            redirect_to root_path, alert: 'Hold on right there champion. You cannot access this page' unless current_user.admin?
        end

        def set_user
            @user = User.find(params[:user_id])
        end
    end
end
