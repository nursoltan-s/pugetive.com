class WieldsController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def wield_params
      params.require(:wield).permit(:tool_id, :project_id)
    end
end
