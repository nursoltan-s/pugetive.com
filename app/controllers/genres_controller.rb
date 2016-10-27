class GenresController < MetaResourceController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.require(:genre).permit(:interest_id, :name)
    end
end
