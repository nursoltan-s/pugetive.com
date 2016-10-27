class PlacesController < MetaResourceController


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :parent_id, :lft, :rgt, :depth, :children_count)
    end
end
