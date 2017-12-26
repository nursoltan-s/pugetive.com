class AlbumsController < SeriesController

  def show
    authorize(@album, :show?)
  end

  private

    def album_params
      params.require(:album).permit(series_params_list)
    end

end