class ToolsController < MetaResourceController

  def index
    if params[:type]
      @tools = params[:type].constantize.all
    else
      @tools = Tool.all
    end
    policy_scope(@tools)
    authorize(@tools, :index?)
  end

  def post_destroy_path
    tools_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:fluency,
                                   :front_end,
                                   :interest_id,
                                   :name,
                                   :resume,
                                   :sort,
                                   :type)
    end
end
