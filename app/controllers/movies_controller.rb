class MoviesController < WorksController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(work_params_list)
    end

end