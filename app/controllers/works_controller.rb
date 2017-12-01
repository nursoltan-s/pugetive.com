class WorksController < MetaResourceController



  def tools
    @work = Work.friendly.find(params[:work_id])
    authorize(@work, :tools?)
    render(partial: "works/tools",
           locals: {work: @work},
           layout: false)
    return
  end

  def post_destroy_path
    works_path
  end

  # def update
  #  #  update_params = work_params
  #  #  raise update_params['image'].keys.inspect
  #  # if update_params["image"].present?
  #  #    update_params["image"].keys.each { |key| update_params["images_attributes"][key]["user_id"] = current_user.id }
  #  #  end

  #   if @work.update(work_params)
  #     raise 'done'
  #   else
  #     raise 'hell'
  #   end
  # end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:author_id,
                                   :demo,
                                   :description,
                                   :favorite,
                                   :flickr_id,
                                   :genre_id,
                                   :image,
                                   :instagram_id,
                                   :interest_id,
                                   :live,
                                   :location,
                                   :name,
                                   :party_id,
                                   :place_id,
                                   :slug,
                                   :start_year,
                                   :status,
                                   :status_message,
                                   :stop_year,
                                   :soundcloud_id,
                                   :summary,
                                   :url)
    end
end
