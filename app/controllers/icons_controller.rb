class IconsController < MetaResourceController

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def icon_params
      params.require(:icon).permit(:name, :type, :token)
    end

end
