require 'rails_helper'

feature "Viewing public resume" do

  scenario "as a visitor" do
    visit "/resume/todd-gehman-resume.pdf"
    convert_pdf_to_page

    expect(page).to have_content('Penn State')
  end
end

feature "Hitting resume PDF generation path" do

  before(:each) do
    setup_resume
  end

  scenario "as a visitor" do
    visit "/resume.pdf"

    expect(page).to have_http_status(:not_found)
  end

  scenario "as admin"
  # scenario "as admin" do
  #   user = FactoryBot.create(:user, id: TODD_USER_ID)
  #   sign_in(user.email, user.password)

  #   visit '/resume.pdf'
  #   convert_pdf_to_page

  #   expect(page).to have_content('Penn State')
  # end

end
