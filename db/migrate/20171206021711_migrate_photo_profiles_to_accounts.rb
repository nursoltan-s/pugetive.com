class MigratePhotoProfilesToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column(:accounts, :interest_id, :integer, null: false)

    linkedin = Account.first
    linkedin.interest_id = SOFTWARE_INTEREST_ID
    linkedin.save!

  end
end
