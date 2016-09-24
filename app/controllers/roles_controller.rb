class RolesController < MetaResourceController


  def new
    @role = Role.new(work_id: params[:work_id])
    authorize @role
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:work_id, :title_id)
    end

    def post_create_path
      @role.work
    end
end
