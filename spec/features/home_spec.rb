require 'rails_helper'

describe "Create place scenario" do
  context "Go to home page" do
    it "opens homepage" do
      visit('/')
    end
  end
  # context "Click on create object link" do
  #   it "opens create new object form" do
  #     find(:homepage_navigation_create_object).click
  #   end
  # end
end


# feature "Signing in" do
#   background do
#     User.make(email: 'user@example.com', password: 'caplin')
#   end

#   scenario "Signing in with correct credentials" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Email', with: 'user@example.com'
#       fill_in 'Password', with: 'caplin'
#     end
#     click_button 'Sign in'
#     expect(page).to have_content 'Success'
#   end

#   given(:other_user) { User.make(email: 'other@example.com', password: 'rous') }

#   scenario "Signing in as another user" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Email', with: other_user.email
#       fill_in 'Password', with: other_user.password
#     end
#     click_button 'Sign in'
#     expect(page).to have_content 'Invalid email or password'
#   end
# end

