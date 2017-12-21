class PhotosController < WorksController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(work_params_list)
    end

end