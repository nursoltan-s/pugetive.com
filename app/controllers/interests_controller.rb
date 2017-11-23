class InterestsController < MetaResourceController

  def show
    authorize(@interest)

    case params[:id]
    when 'photography'
      @series = Series.includes(works: [:titles, :tools, :interest, :flickr_urls]).photography
    when 'music'
      @series = Series.includes(works: [:titles, :tools, :interest, :flickr_urls]).music
      @band_recordings = Series.band.studio.uniq.sort{|a, b| b.stop_year <=> a.stop_year}
      @solo_recordings = Series.solo.music.uniq.sort{|a, b| b.stop_year <=> a.stop_year}

    when 'writing'
      @blogs = Work.where('name LIKE "%typepad%" OR name LIKE "%medium%"')
      @reviews = Work.reviews
      @haiku = Series.where('name LIKE "%haiku%"')
      @projects = Work.writing - @blogs - @reviews - @haiku.map{|s| s.works}.flatten
    end


  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
