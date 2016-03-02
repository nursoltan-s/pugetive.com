class EmailsController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:address, :category)
    end
end
