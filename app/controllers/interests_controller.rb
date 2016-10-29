class InterestsController < MetaResourceController

  def show
    authorize(@interest)

    case params[:id]
    when 'photography'
      @series = Series.photography
    when 'music'
      @series = Series.music.includes(works: [:titles, :tools])
    when 'writing'
      @blogs = Work.where('name LIKE "%typepad%" OR name LIKE "%medium%"')

      @haiku = Series.where('name LIKE "%haiku%"')
    end


  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
