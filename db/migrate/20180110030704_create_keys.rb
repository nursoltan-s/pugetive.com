class CreateKeys < ActiveRecord::Migration[5.1]
  def change
    ActiveRecord::Base.connection.execute "SET collation_connection = 'utf8_general_ci' "

    create_table :keys, force: true do |t|
      t.string :name, limit: 16, null: false
      t.string :short_name, null: false
      t.string :slug
    end

    add_index(:keys, :name)
    add_index(:keys, :short_name)
    add_index(:keys, :slug)

    Key::TONICS.each do |tonic|
      Key.create(name: "#{tonic.gsub('♭', ' flat').gsub('♯', ' sharp')} major",
                 short_name: tonic)
      Key.create(name: "#{tonic.gsub('♭', ' flat').gsub('♯', ' sharp')} minor",
                 short_name: "#{tonic}m")
    end
  end
end
