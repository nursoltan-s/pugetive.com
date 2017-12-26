class VariantsController < MetaResourceController

  def new
    @variant = Variant.new(work_id: params[:work_id])
    authorize(@variant, :create?)
  end


  private
    def variant_params
      params.require(:variant).permit(:name,
                                      :work_id,
                                      :year,
                                      documents_attributes: [:data, :name])
    end

    def post_create_path
      @variant.work
    end

    def post_update_path
      @variant.work
    end

end
