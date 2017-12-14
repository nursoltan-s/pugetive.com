class AddSummaryToInterests < ActiveRecord::Migration[5.1]
  def change
    add_column(:interests, :summary, :string)

    software = Interest.find(SOFTWARE_INTEREST_ID)
    software.summary = 'Actively seeking my next big gig in New York City. ' +
                       'NERD ALERT: This resume gets generated automatically from the database and ' +
                       '<a href="https://github.com/pugetive/pugetive.com/blob/master/app/views/resume/show.pdf.haml">software</a> ' +
                       'powering this site.'
    software.save!

    film = Interest.find(FILM_INTEREST_ID)
    film.summary = 'I learned with scissors and tape and, yes, I consider this a handicap.'
    film.save!

    writing = Interest.find(WRITING_INTEREST_ID)
    writing.summary = 'I find the editing process to be quiet rewording.'
    writing.save!
  end
end
