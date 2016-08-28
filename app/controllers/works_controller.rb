class WorksController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(
                                   :description, 
                                   :interest_id, 
                                   :live, 
                                   :name, 
                                   :party_id, 
                                   :slug, 
                                   :start_year,
                                   :status,
                                   :stop_year, 
                                   :summary, 
                                   :url)
    end
end
