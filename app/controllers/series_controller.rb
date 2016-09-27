class SeriesController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:description,
                                     :name, 
                                     :summary)
    end
end
