class WieldsController < MetaResourceController

  def new
    @wield = Wield.new(project_id: params[:project_id])
    authorize(@wield)
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def wield_params
      params.require(:wield).permit(:tool_id, :work_id, :legacy)
    end

    def post_create_path
      @wield.work
    end

    def post_destroy_path
      works_path
    end

    def post_update_path
      @wield.work
    end
end
