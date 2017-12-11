class InterestsController < MetaResourceController

  def show
    send(@interest.token)

    # when 'writing'
    # end

  end

  def software
    authorize(@interest)

    @featured = []
    @pro_projects = []
    @side_projects = []

    App.cached.each do |app|
      if app.favorite?
        @featured << app
      end
      if app.solo?
        @side_projects << app
      else
        @pro_projects << app
      end
    end
    render 'software'
  end

  def music
    authorize(@interest)
    @bands = Band.cached

    @band_recordings = Album.band_recordings
    @solo_recordings = Album.solo_recordings

    render :music
  end

  def photography
    authorize(@interest)
    @portfolios    = Gallery.portfolios.sort_by{|p| -p.photos.count}
    @non_portfolios = Gallery.non_portfolios

    @profiles   = Account.photography

    render :photography
  end

  def film
    authorize(@interest)

    @featured = Movie.favorites
    @other_projects = Movie.unfavorites

    render :film
  end

  def writing
    authorize(@interest)

    @blogs = Piece.blogs
    @reviews = Piece.reviews
    @haiku = Collection.haiku
    @projects = Piece.other_projects

    render :writing
  end

  # caches_action :show

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
