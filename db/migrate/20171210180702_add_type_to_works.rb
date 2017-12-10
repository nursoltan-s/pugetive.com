class AddTypeToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column(:works, :type, :string, null: false, limit: 16, default: 'App')

    add_index(:works, :type)
    add_index(:works, [:type, :id])

    Work.all.each do |work|
      case work.interest_id
      when SOFTWARE_INTEREST_ID
        # Already set by default
      when MUSIC_INTEREST_ID
        work.type = 'Song'
      when PHOTOGRAPHY_INTEREST_ID
        work.type = 'Photo'
      when FILM_INTEREST_ID
        work.type = 'Movie'
      when WRITING_INTEREST_ID
        work.type = 'Piece'
      end
      work.save!
    end

    sql = <<-SQL
      ALTER TABLE works
      CHANGE COLUMN type type varchar(16) NOT NULL DEFAULT 'App'
      AFTER interest_id;
    SQL
    ActiveRecord::Base.connection.execute(sql)

  end
end
