class ProjectsController < MetaResourceController

  def index
    @projects ||= Project.all
    authorize(@projects, :index?)
    @categories ||= [:software, :music, :photography]
  end

  def software
    @projects = Project.software
    @categories = [:software]
    authorize(@projects, :index?)
    render :index
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :type, :party_id, :url, :start_year, :stop_year, :description, :live, :official_title, :summary)
    end

    def post_destroy_path
      projects
    end
end
