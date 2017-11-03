class InterestsController < MetaResourceController

  def show
    authorize(@interest)

    case params[:id]
    when 'photography'
      @series = Series.includes(works: [:titles, :tools, :interest, :flickr_urls]).photography
    when 'music'
      @series = Series.includes(works: [:titles, :tools, :interest, :flickr_urls]).music
    when 'writing'
      @blogs = Work.where('name LIKE "%typepad%" OR name LIKE "%medium%"')
      @haiku = Series.where('name LIKE "%haiku%"')
      @projects = Work.writing - @blogs - @haiku.map{|s| s.works}.flatten
    end


  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
