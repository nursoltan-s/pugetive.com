class AddSummaryToParties < ActiveRecord::Migration[5.0]

  def change
    add_column(:parties, :summary, :string)
  end
end
