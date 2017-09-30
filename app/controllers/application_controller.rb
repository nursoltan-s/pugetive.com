class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :remember_location, :canonize_domain, :set_mini_profiler

  after_action :verify_authorized, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index


  rescue_from Pundit::NotAuthorizedError, with: :unauthorized



  private

    def unauthorized
      render :file => 'public/401.html', :status => :unauthorized, :layout => false
    end

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

    def set_mini_profiler
      if current_user && current_user.admin?
        Rack::MiniProfiler.authorize_request
      end
    end
end
