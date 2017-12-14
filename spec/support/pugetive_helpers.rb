module PugetiveHelpers

  def setup_pugetive
    setup_interests

    create(:icon, name: 'question')

    todd = Artist.find(TODD_PARTY_ID) rescue nil
    if todd.nil?
      todd = create(:artist, name: 'Todd Gehman', id: TODD_PARTY_ID)
    end
  end

  def setup_interests
    return if Interest.any?
    create(:interest,
           name: 'Software',
           sort: 1,
           work_name: 'App',
           series_name: 'Suite',
           token: 'software',
           slug: 'software',
           icon: 'laptop',
           id: SOFTWARE_INTEREST_ID)
    create(:interest,
           name: 'Music',
           sort: 2,
           series_name: 'Album',
           work_name: 'Song',
           token: 'music',
           slug: 'music',
           icon: 'music-note',
           id: MUSIC_INTEREST_ID)
    create(:interest,
           name: 'Photography',
           sort: 3,
           work_name: 'Photo',
           series_name: 'Gallery',
           token: 'photography',
           slug: 'photography',
           icon: 'camera',
           id: PHOTOGRAPHY_INTEREST_ID)
    create(:interest,
           name: 'Film',
           sort: 4,
           work_name: 'Movie',
           series_name: 'Series',
           token: 'film',
           slug: 'film',
           icon: 'movie-camera',
           id: FILM_INTEREST_ID)
    create(:interest,
           name: 'Writing',
           sort: 5,
           work_name: 'Piece',
           series_name: 'Series',
           token: 'writing',
           slug: 'writing',
           icon: 'pen',
           summary: 'I find the editing process to be quiet rewording',
           id: WRITING_INTEREST_ID)
  end


  def convert_pdf_to_page
      temp_pdf = Tempfile.new('pdf')
      temp_pdf << page.source.force_encoding('UTF-8')
      reader = PDF::Reader.new(temp_pdf)
      pdf_text = reader.pages.map(&:text)
      temp_pdf.close
      page.driver.response.instance_variable_set('@body', pdf_text)
  end

  def clean_db
    DatabaseCleaner.clean_with(:truncation)
  end

end


RSpec.configure do |c|
  c.include PugetiveHelpers
end

