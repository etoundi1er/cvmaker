module Frontend
    class CertificationsController < FrontendController
        before_action :set_user
        before_action :set_cv_template
        before_action :set_certification, only: %i[update destroy]

        def new
            @certification = @user.certifications.new(cv_template: @cv_template)
        end

        def create
            @certification = @user.certifications.new(certification_params)
            if @certification.save
                flash.now[:notice] = 'Successfully saved'
            else
                flash.now[:alert] = @certification.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def update
            if @certification.update(certification_params)
                flash.now[:notice] = 'Successfully saved.'
            else
                flash.now[:alert] = @certification.errors.full_messages.to_sentence
            end
            render 'success.js'
        end

        def destroy
            if @certification.destroy
                flash.now[:notice] = 'Successfully deleted.'
            else
                flash.now[:alert] = @certification.errors.full_messages.to_sentence
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

        def set_certification
            @certification = @cv_template.certifications.find(params[:id])
        end

        def certification_params
            params.require(:certification).permit(:cv_template_id, :title, :company, :location, :certification_date, :summary)
        end
    end
end
