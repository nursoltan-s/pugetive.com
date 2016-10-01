class TitlesController < MetaResourceController

  def index
    if params[:category]
      @titles = Title.send(params[:category].downcase)
    else
      @titles = Title.all
    end
    policy_scope(@titles)
    authorize(@titles, :index?)
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def title_params
      params.require(:title).permit(:category,
                                    :name,
                                    :sort)
    end
end
