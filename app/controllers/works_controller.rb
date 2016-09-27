class WorksController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(
                                   :demo,
                                   :description, 
                                   :favorite,
                                   :interest_id, 
                                   :live,
                                   :location,
                                   :name, 
                                   :party_id, 
                                   :slug, 
                                   :start_year,
                                   :status,
                                   :status_message,
                                   :stop_year, 
                                   :summary, 
                                   :url)
    end
end
