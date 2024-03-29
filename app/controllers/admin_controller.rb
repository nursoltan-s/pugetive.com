class AdminController < ApplicationController

  rescue_from Pundit::NotAuthorizedError, with: :render_unauthorized

  def status
    unless flash[:alert]
      flash.now[:alert] = "This is a hard-coded test alert. How does it look?"
    end
    unless flash[:notice]
      flash.now[:notice] = "This is a hard-coded test notice. How does it look?"
    end
    authorize :about, :status?

  end

  def random
    authorize :about, :random?
    if params[:model].blank?
      redirect_to :back, notice: "No model was specified, so I did didley squat."
      return
    end

    redirect_to Experi::DynamicItem.new(params[:model]).random and return
  end

  def touch
    authorize :about, :touch?
    object = DynamicItem.new(params[:object_type], params[:object_id]).item
    object.touch
    redirect_to :back, notice: "#{object.class.name} ##{object.id} has been touched."
  # rescue ActionController::RedirectBackError
  #   redirect_to root_path, notice: "#{object.class.name} ##{object.id} has been touched."
  end

  def exception
    case params[:id].to_i
    when 404
      raise ActionController::RoutingError.new('Not Found')
    when 500
      raise "Exception"
    end
  end

end