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
            @user = User.find(params[:id])
            if @user.destroy
                redirect_to admin_path(section: 'users'), notice: "#{@user.name} destroyed."
            else
                redirect_to admin_path(section: 'users'), alert: @user.errors.full_messages.to_sentence
            end
        end

        def login_as_user
            sign_in(:user, User.find(params[:id]), { bypass: true })
            redirect_to root_url
        end

        def recreate_dummy_cvs
            CvTemplate.where('lower(title) = ?', 'example cv').destroy_all
            User.all.each(&:create_dummy_cv)
            redirect_to admin_path(section: 'cv_templates'), notice: 'Example CVs recreated'
        end

        private

        def check_admin
            redirect_to root_path, alert: 'Hold on right there champion. You cannot access this page' unless current_user.admin?
        end
    end
end
