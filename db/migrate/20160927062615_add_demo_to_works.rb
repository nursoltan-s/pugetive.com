class AddDemoToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :demo, :boolean, null: false, default: 0)
  end
end
