class TitlesController < MetaResourceController

  def index
    if params[:interest_id]
      @titles = Title.for(params[:interest_id])
    else
      @titles = Title.all
    end
    policy_scope(@titles)
    authorize(@titles, :index?)
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def title_params
      params.require(:title).permit(:interest_id,
                                    :name,
                                    :sort)
    end
end
