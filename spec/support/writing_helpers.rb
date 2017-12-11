module WritingHelpers

  def setup_writing
    amazon = create(:party,      name: 'Amazon.com')
    medium = create(:piece,      name: 'Medium Blog', start_year: 2015)
    haiku  = create(:collection, name: 'Bad Rock Haiku')
    begin
      todd   = create(:party,  name: 'Todd Gehman', id: TODD_PARTY_ID)
    rescue ActiveRecord::RecordNotUnique
      todd = Artist.find(TODD_PARTY_ID)
    end

    ['Haiku: Jesse Sykes at the Tractor Tavern', 'Haiku: Spoon at Neumos', 'Haiku: Mike Dumovich at the Josephine'].each do |name|
      piece = create(:piece, name: name, party_id: TODD_PARTY_ID)
      haiku.pieces << piece
    end

    ['Temperament', 'Black Sea', 'Wine for Dummies'].each do |name|
      piece = create(:piece, name: name, party_id: amazon.id, genre_id: AMAZON_GENRE_ID)
    end

    create(:piece, name: 'Skeleton Coast')

  end
end

RSpec.configure do |c|
  c.include WritingHelpers
end
