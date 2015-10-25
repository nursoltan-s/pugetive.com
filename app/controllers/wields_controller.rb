class WieldsController < MetaResourceController

  def new
    @wield = Wield.new(project_id: params[:project_id])
    authorize(@wield)
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def wield_params
      params.require(:wield).permit(:tool_id, :project_id)
    end
end
