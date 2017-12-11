class SeriesController < MetaResourceController

  def show
    authorize(@series, :show?)
    if params[:controller] == 'series' and
      params[:action] == 'show'
      redirect_to @series.canonical_path, status: 301
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:audience,
                                     :description,
                                     :image,
                                     :name,
                                     :summary,
                                     :type)
    end
end
