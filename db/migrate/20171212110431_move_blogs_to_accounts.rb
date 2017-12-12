class MoveBlogsToAccounts < ActiveRecord::Migration[5.1]
  def change
    Piece.blogs.each do |piece|
      Account.create!(name:        piece.name,
                      username:    'pugetive',
                      interest_id: piece.interest_id,
                      url:         piece.url,
                      start_year:  piece.start_year,
                      stop_year:   piece.stop_year)

      piece.destroy
    end
  end
end
