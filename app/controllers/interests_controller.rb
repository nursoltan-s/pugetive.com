class InterestsController < MetaResourceController

  def show
    send(@interest.token)

    # when 'writing'
    # end

  end

  def software
    authorize(@interest)
    @featured = @pro_projects = @side_projects = []
    App.sorted.each do |app|
      if app.favorite?
        @featured << app
      elsif app.solo?
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

    @series = Series.music

    @band_recordings = Series.band_recordings
    @solo_recordings = Series.solo_recordings

    render :music
  end

  def photography
    authorize(@interest)
    # @series = Series.includes(photographs: [:titles, :tools, :interest]).photography
    @portfolios = Series.portfolio
    @series = Series.non_portfolio.photography
    @profiles = Photo.websites.sorted
    render :photography
  end

  def film
    authorize(@interest)

    @featured = @interest.works.favorite.sorted
    @other_projects = @interest.works.unfavorite.sorted

    render :film
  end

  def writing
    authorize(@interest)
    @blogs = Piece.blogs
    @reviews = Piece.reviews
    @haiku = Series.haiku
    @projects = Piece.other_projects
    render :writing
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
