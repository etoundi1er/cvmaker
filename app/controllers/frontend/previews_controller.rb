module Frontend
    class PreviewsController < FrontendController
        before_action :set_user
        before_action :set_cv_template

        layout 'pdf'

        def show; end

        def generate_pdf
            respond_to do |format|
                format.html
                format.pdf do
                    render pdf:         @cv_template.template,
                           template:    'frontend/previews/generate_pdf.html.erb',
                           layout:      'pdf.html'
                end
            end
        end

        private

        def set_user
            @user = current_user
        end

        def set_cv_template
            @cv_template = @user.cv_templates.find(params[:cv_template_id])
        end
    end
end
