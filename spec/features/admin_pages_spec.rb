require 'rails_helper'

# MODELS = [:account,
#           :address,
#           :award,
#           :email,
#           :genre,
#           :icon,
#           :interest,
#           :lyric,
#           :party,
#           :phone,
#           :place,
#           :role,
#           :series,
#           :title,
#           :tool,
#           :work]

MODELS = [:account]

feature "Viewing Interest index page" do

  scenario "as a visitor" do
    visit interests_path

    expect(page).to have_http_status(:unauthorized)
  end
end



MODELS.each do |token|
  feature "Viewing #{token} index page" do


    scenario "as a visitor" do
      visit send(get_path(token))

      expect(page).to have_http_status(:unauthorized)
    end

    scenario "as the admin" do
      create(:interest)
      create(token)

      user = FactoryBot.create(:user)
      sign_in(user.email, user.password)

      visit send(get_path(token))

      expect(page).to have_http_status(200)
    end

  end

end

def get_path(token)
  path = token.to_s.pluralize + "_path"
  if token == :series
    path = 'series_index_path'
  end
  path
end