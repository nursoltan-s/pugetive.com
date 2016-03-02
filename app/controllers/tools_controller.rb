class ToolsController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:name, :type, :category, :front_end)
    end
end
