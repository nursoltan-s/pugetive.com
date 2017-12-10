class AppsController < WorksController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(work_params_list)
    end

end