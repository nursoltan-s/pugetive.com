class AddTypeToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column(:series, :type, :string, null: false, default: 'Album', limit: 16)

    add_index(:series, :type)
    add_index(:series, [:type, :id])

    Series.photography.each do |gallery|
      gallery.type = 'Gallery'
      gallery.save!
    end

    Series.writing.all.each do |collection|
      collection.type = 'Collection'
      collection.save!
    end

    sql = <<-SQL
      ALTER TABLE series
      CHANGE COLUMN type type varchar(16) NOT NULL DEFAULT 'Album'
      AFTER id;
    SQL
    ActiveRecord::Base.connection.execute(sql)

  end

end
