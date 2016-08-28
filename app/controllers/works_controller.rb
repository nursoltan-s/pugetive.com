class WorksController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:name, :interest_id, :party_id, :url, :start_year, :stop_year, :description, :summary, :live, :slug)
    end
end
