class GalleriesController < SeriesController

  def show
    authorize(@gallery, :show?)
  end

end