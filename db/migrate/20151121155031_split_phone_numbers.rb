class SplitPhoneNumbers < ActiveRecord::Migration
  def change
    remove_column(:phones, :number)

    add_column(:phones, :area_code, :string, limit: 3)
    add_column(:phones, :central_office_number, :string, limit: 3)
    add_column(:phones, :subscriber_number, :string, limit: 4)

    Phone.first.update_attributes(area_code:             '206',
                                  central_office_number: '789',
                                  subscriber_number:     '0033')
  end
end
