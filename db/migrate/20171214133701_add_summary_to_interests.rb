class AddSummaryToInterests < ActiveRecord::Migration[5.1]
  def change
    add_column(:interests, :summary, :string)

    writing = Interest.find_by(name: 'Writing')
    writing.summary = 'I find the editing process to be quiet rewording.'
  end
end
