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

    @series = Series.includes(works: [:titles, :tools, :interest]).music
    @band_recordings = Series.band.studio.uniq.sort{|a, b| b.stop_year <=> a.stop_year}
    @solo_recordings = Series.solo.music.uniq.sort{|a, b| b.stop_year <=> a.stop_year}
    render :music

  end

  def photography
    authorize(@interest)
    # @series = Series.includes(photographs: [:titles, :tools, :interest]).photography
    @portfolios = Series.portfolio
    @series = Series.non_portfolio.photography
    @profiles = Photograph.websites.sorted
    render :photography
  end

  def film
  end

  def writing
    @blogs = Work.where('name LIKE "%typepad%" OR name LIKE "%medium%"')
    @reviews = Work.reviews
    @haiku = Series.where('name LIKE "%haiku%"')
    @projects = Work.writing - @blogs - @reviews - @haiku.map{|s| s.works}.flatten
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
