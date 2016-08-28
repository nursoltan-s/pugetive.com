class InterestsController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:name, :sort, :token, :work_name, :series_name, :public, :icon)
    end
end
