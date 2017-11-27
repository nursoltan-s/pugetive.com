class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :remember_location, :canonize_domain, :set_mini_profiler

  after_action :verify_authorized, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index


  # rescue_from Unauthorized,                        with: :render_unauthorized
  # rescue_from NotFound,                            with: :render_not_found
  # rescue_from BadRequest,                          with: :render_bad_request
  # rescue_from Conflict,                            with: :render_conflict
  # rescue_from ActionController::RoutingError,      with: :render_not_found
  # rescue_from ActionController::UnknownController, with: :render_not_found
  # rescue_from ActionController::UnknownAction,     with: :render_not_found

  rescue_from Pundit::NotAuthorizedError,          with: :render_unauthorized
  rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
  rescue_from ActionController::RoutingError,      with: :render_not_found
  rescue_from StandardError,                       with: :render_system_error
  rescue_from NoMethodError,                       with: :render_system_error

  private

    def render_unauthorized
      render :file => 'public/errors/401.html', :status => :unauthorized, :layout => false
    end

    def render_not_found
      render :file => 'public/errors/404.html', :status => 404, :layout => false
    end

    def render_system_error
      if Rails.env == 'production' or params[:action] == 'exception'
        render :file => 'public/errors/500.html', :status => 500, :layout => false
      end
      raise
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
      if request.host_with_port != PUGETIVE_CONFIG[Rails.env][:host_with_port]
        permanent_redirect("#{CONFIG[Rails.env][:host_protocol]}://#{PUGETIVE_CONFIG[Rails.env][:host_with_port]}#{request.path}")
      end

      if Rails.env == 'staging'
        authenticate_or_request_with_http_basic do |username, password|
          md5_of_password = Digest::MD5.hexdigest(password)
          username == 'todd' && md5_of_password == 'a14ca2dc7e22456086d980ad819bfe85'
        end
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
