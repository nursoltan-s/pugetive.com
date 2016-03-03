class AddFluencyToTools < ActiveRecord::Migration[5.0]
  def change
    add_column(:tools, :fluency, :tinyint, null: false, default: 0)
    add_index(:tools, :fluency)
  end
end
