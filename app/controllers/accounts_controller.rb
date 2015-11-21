class AccountsController < MetaResourceController

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:company, :username, :url)
    end
end
