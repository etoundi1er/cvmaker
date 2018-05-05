module Frontend
    class CvTemplatesController < FrontendController
        def index
            @cv_templates = current_user.cv_templates.all
        end
    end
end
