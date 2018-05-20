class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_marketing_scope
    before_action :set_locale

    unless Rails.env.development?
        rescue_from ActiveRecord::RecordNotFound do |exception|
            Rails.logger.fatal "rescued from ActiveRecord::RecordNotFound -- exception: #{exception}"
            if request.xhr?
                render text: 'Not Found', status: 404
            else
                redirect_to :root, alert: 'Page Not Found'
            end
        end
        rescue_from ActionController::UnknownFormat do |exception|
            Rails.logger.fatal "rescued from ActionController::UnknownFormat -- exception: #{exception}"
            if request.xhr?
                render text: 'UnknownFormat', status: 406
            else
                render status: 406, template: 'pages/error_404.html'
            end
        end
        # :nocov:
        rescue_from ActionController::RoutingError do |exception|
            Rails.logger.fatal "rescued from ActionController::RoutingError -- exception: #{exception}"
            if request.xhr?
                render text: 'RoutingError', status: 404
            else
                render status: 404, template: 'pages/error_404.html'
            end
        end
        # :nocov:
        rescue_from ActionController::InvalidCrossOriginRequest do |exception|
            Rails.logger.fatal "rescued from ActionController::InvalidCrossOriginRequest -- exception: #{exception}"
            self.response_body = nil
            render status: 422, text: 'Invalid Request'
        end

        rescue_from ArgumentError do |exception|
            Rails.logger.fatal "rescued from ArgumentError -- exception: #{exception}"
            if request.xhr?
                render text: 'ArgumentError', status: 500
            else
                render status: 500, template: 'pages/error_404.html'
            end
        end
    end

    def default_url_options
        { locale: I18n.locale }
    end

    def set_locale
        locale = params[:locale].to_s.strip.to_sym
        I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def set_marketing_scope
        @marketing_scope = true unless current_user
    end
end
