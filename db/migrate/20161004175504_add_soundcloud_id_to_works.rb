class AddSoundcloudIdToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :soundcloud_id, :integer)
    add_index(:works, :soundcloud_id)
  end
end
