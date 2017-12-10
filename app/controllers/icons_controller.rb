class IconsController < MetaResourceController

  def index
    if params[:category]
      @icons = Icon.from_category(params[:category])
    else
      @icons = Icon.all
    end

    policy_scope(Icon)
    authorize(Icon, :update?)

  end

  def post_create_path
    icons_path
  end

  def post_update_path
    icons_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def icon_params
      params.require(:icon).permit(:name, :type, :token, :category)
    end

end
