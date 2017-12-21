class PiecesController < WorksController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def piece_params
      params.require(:piece).permit(work_params_list)
    end

end