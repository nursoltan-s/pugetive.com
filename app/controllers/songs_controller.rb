class SongsController < WorksController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(work_params_list)
    end

end