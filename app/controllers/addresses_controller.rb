class AddressesController < MetaResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:street, :unit, :city, :state, :zip)
    end
end
