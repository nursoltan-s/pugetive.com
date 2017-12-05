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
    App.includes(:titles).sorted.each do |app|
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
    @bands = Party.bands.sort{|a, b| b.stop_year <=> a.stop_year}

    @band_recordings = Album.band_recordings
    @solo_recordings = Album.solo_recordings

    render :music
  end

  def photography
    authorize(@interest)
    @portfolios = Gallery.portfolio.sort_by{|p| -p.photos.count}
    @series     = Gallery.non_portfolio.sort_by{|p| -p.stop_year}

    # Refactor: Profiles need a new data model
    @profiles   = Photo.websites.sort_by{|p| -p.stop_year}
    render :photography
  end

  def film
    authorize(@interest)

    @featured = Movie.favorite
    @other_projects = Movie.unfavorite

    render :film
  end

  def writing
    authorize(@interest)
    # Refactor: Pull everything at once and segment in ruby
    @blogs = Piece.blogs
    @reviews = Piece.reviews
    @haiku = Series.haiku
    @projects = Piece.other_projects
    render :writing
  end

  caches_action :software, :music, :photography, :film, :writing

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
