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
      params.require(:series).permit(series_params_list)
    end

    def series_params_list
      [:audience,
       :description,
       :interest_id,
       :name,
       :summary,
       :type,
       images_attributes: [:data, :name]]
    end

end
