class PartiesController < MetaResourceController



  def post_update_path
    party_path(@party)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:alias,
                                    :description,
                                    :live,
                                    :location,
                                    :name,
                                    :official_title,
                                    :start_year,
                                    :stop_year,
                                    :summary,
                                    :type,
                                    :url,
                                    images_attributes: [:data, :name])
    end
end
