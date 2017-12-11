class CollectionsController < SeriesController

  def show
    authorize(@collection, :show?)
  end

end