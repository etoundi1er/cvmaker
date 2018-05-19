class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_marketing_scope
    before_action :set_locale

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
