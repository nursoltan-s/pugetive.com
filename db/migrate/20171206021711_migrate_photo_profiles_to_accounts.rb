class MigratePhotoProfilesToAccounts < ActiveRecord::Migration[5.1]
  def change
    rename_column(:accounts, :company, :name)

    add_column(:accounts, :interest_id, :integer, null: false)
    add_column(:accounts, :start_year,  :integer)
    add_column(:accounts, :stop_year,   :integer)

    linkedin = Account.first
    linkedin.interest_id = SOFTWARE_INTEREST_ID
    linkedin.save!

    Account.create!(name: 'Instagram',
                    interest_id: PHOTOGRAPHY_INTEREST_ID,
                    username: 'pugetive',
                    url: 'https://www.instagram.com/pugetive/',
                    start_year: 2015)

    Account.create(name: 'Flickr',
                   interest_id: PHOTOGRAPHY_INTEREST_ID,
                   username: 'pugetive',
                   url: 'https://www.flickr.com/photos/pugetive',
                   start_year: 2004,
                   stop_year:  2014)


    Photo.where("name like '%flickr%' or name like '%instagram%'").map(&:destroy)
  end
end
