class AlbumsController < SeriesController

  def show
    authorize(@album, :show?)
  end

end