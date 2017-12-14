require 'rails_helper'


feature "Viewing Interest index page" do

  scenario "as a visitor" do
    visit interests_path

    expect(page).to have_http_status(:unauthorized)
  end
end

[:account,
 :address,
 :award,
 :email,
 :genre,
 :icon,
 :interest,
 :lyric,
 :party,
 :phone,
 :place,
 :role,
 :series,
 :titles,
 :tools,
 :works].each do |token|
  feature "Viewing #{token} index page" do

    scenario "as a visitor" do
      path = token.to_s.pluralize + "_path"
      if token == :series
        path = 'series_index_path'
      end
      visit send(path)

      expect(page).to have_http_status(:unauthorized)
    end
  end

end
