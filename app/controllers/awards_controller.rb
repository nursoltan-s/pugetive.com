class AwardsController < MetaResourceController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def award_params
      params.require(:award).permit(:name, :official_title, :summary, :url, :live, :start_year, :stop_year)
    end
end
