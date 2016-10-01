class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :remember_location, :canonize_domain

  after_action :verify_authorized, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index


  private

    def remember_location
      if ['show', 'index'].include?(params[:action])
        set_return_to
      end
    end

    def set_return_to
      session[:return_to] = request.fullpath
    end

    def canonize_domain
      # return unless request.subdomains.any?
      if request.host_with_port != CONFIG[Rails.env][:host_with_port]
        permanent_redirect("#{CONFIG[Rails.env][:host_protocol]}://#{CONFIG[Rails.env][:host_with_port]}#{request.path}")
      end
    end

    def permanent_redirect(url_options)
      flash.keep
      redirect_to(url_options, :status => 301)
    end
end
