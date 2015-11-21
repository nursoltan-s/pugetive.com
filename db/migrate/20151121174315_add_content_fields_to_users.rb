class AddContentFieldsToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :one_liner, :string)
    add_column(:users, :objective, :text)
    add_column(:users, :summary, :text)
  end
end
