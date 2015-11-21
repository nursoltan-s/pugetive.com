class ProjectsController < MetaResourceController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :type, :party_id, :url, :start_year, :stop_year, :description, :live)
    end

    def post_destroy_path
      projects
    end
end
