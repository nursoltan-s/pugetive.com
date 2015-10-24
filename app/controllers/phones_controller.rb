class PhonesController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:number, :category)
    end
end
