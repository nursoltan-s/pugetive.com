class SeriesWorksController < MetaResourceController
  def show
    authorize(@series_work, :show?)
    @series = @series_work.series
    @work = @series_work.work
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def series_work_params
      params.require(:series_work).permit(:series_id, :work_id)
    end

    def post_create_path
      item.series
    end
end
