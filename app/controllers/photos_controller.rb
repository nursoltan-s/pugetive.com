class PhotosController < WorksController

  def daily
    headers['Access-Control-Allow-Origin'] = '*'

    # @photo = Photo.find(348)
    authorize(:about, :home?)
    respond_to do |format|
      format.json
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(work_params_list)
    end

end