module Frontend
    class PreviewsController < FrontendController
        before_action :set_user
        before_action :set_cv_template

        layout 'pdf'

        def show; end

        def download
            respond_to do |format|
                format.html
                format.pdf { send_cv_template_pdf }
            end
        end

        private

        def set_user
            @user = current_user
        end

        def set_cv_template
            @cv_template = @user.cv_templates.find(params[:cv_template_id])
        end

        def send_cv_template_pdf
            @cv_template_pdf = CvTemplatePdf.new(@cv_template)

            send_file(@cv_template_pdf.to_pdf,
                      filename: @cv_template_pdf.filename,
                      type: 'application/pdf',
                      disposition: 'inline')
        end
    end
end
