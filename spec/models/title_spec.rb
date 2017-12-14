require 'rails_helper'

describe Title do
   before(:all) do
     setup_pugetive
     setup_software
   end

  describe '#destroy' do
    it 'destroys any associated roles' do
      title = create(:title, name: 'Developer', interest_id: SOFTWARE_INTEREST_ID)
      app  = create(:app,  name: 'Catsubst Macro DB')
      app.titles << title

      expect(app.titles.size).to be 1

      title.destroy

      expect(Role.where(title_id: title.id).count).to eq 0
    end
  end

  describe '.for' do
    it 'filters the list of titles by interest' do
      title = create(:title, name: 'Editor', interest_id: FILM_INTEREST_ID)
      software_titles = Title.for(SOFTWARE_INTEREST_ID)
      film_titles = Title.for(FILM_INTEREST_ID)

      expect(software_titles.size).to be < Title.count
      expect(software_titles.first).to be_software

      expect(film_titles.size).to be < Title.count
      expect(film_titles.first).to be_film
    end
  end

  after(:all) do
    clean_db
  end
end