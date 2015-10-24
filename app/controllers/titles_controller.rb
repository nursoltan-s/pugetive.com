class TitlesController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def title_params
      params.require(:title).permit(:name, :category)
    end
end
