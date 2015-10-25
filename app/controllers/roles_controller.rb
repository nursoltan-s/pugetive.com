class RolesController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:project_id, :title_id)
    end

    def post_create_path
      :back
    end
end
