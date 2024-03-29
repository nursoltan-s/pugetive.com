class WorksController < MetaResourceController


  def new
    @interest = Interest.find(params[:interest_id])
    @work = Work.new(interest_id: @interest.id, type: @interest.work_name)
    authorize(@work, :create?)
  end

  def show
    authorize(:about, :home?)
    # Works are now served via subclasses
    # and this sends any old requests onto the new handlers
    if params[:controller] == 'works' and
      params[:action] == 'show'
      redirect_to @work.canonical_path, status: 301
    end
  end

  def tools
    @work = Work.friendly.find(params[:work_id])
    authorize(@work, :tools?)
    render(partial: "works/tools",
           locals: {work: @work},
           layout: false)
    return
  end

  def meta_info
    @work = Work.friendly.find(params[:work_id])
    authorize(@work, :tools?)
    render(partial: "works/meta_info",
           locals: {work: @work},
           layout: false)
    return
  end


  def post_destroy_path
    works_path
  end

  private

    def work_params
      params.require(:work).permit(work_params_list)
    end

    def work_params_list
      [:author_id,
       :demo,
       :description,
       :favorite,
       :flickr_id,
       :genre_id,
       :instagram_id,
       :interest_id,
       :key_id,
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
       :type,
       :url,
       documents_attributes: [:data, :name],
       images_attributes: [:data, :name]]
    end
end
