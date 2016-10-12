class WorksController < MetaResourceController

  def post_destroy_path
    works_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(
                                   :author_id,
                                   :demo,
                                   :description, 
                                   :favorite,
                                   :flickr_id,
                                   :genre_id,
                                   :image,
                                   :instagram_id,
                                   :interest_id, 
                                   :live,
                                   :location,
                                   :name, 
                                   :party_id, 
                                   :place_id,
                                   :slug, 
                                   :start_year,
                                   :status,
                                   :status_message,
                                   :stop_year, 
                                   :summary, 
                                   :url)
    end
end
