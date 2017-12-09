class IconsController < MetaResourceController

  def post_create_path
    icons_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def icon_params
      params.require(:icon).permit(:name, :type, :token)
    end

end
