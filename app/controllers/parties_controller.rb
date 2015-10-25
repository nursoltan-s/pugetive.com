class PartiesController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:name, :type, :url, :description, :start_year, :stop_year, :location)
    end
end
