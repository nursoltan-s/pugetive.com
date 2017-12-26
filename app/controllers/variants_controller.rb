class VariantsController < MetaResourceController

  def new
    @variant = Variant.new(work_id: params[:work_id])
    authorize(@variant, :create?)
  end


  private
    def variant_params
      params.require(:variant).permit(:work_id, :name, :year)
    end

    def post_create_path
      @variant.work
    end

end
