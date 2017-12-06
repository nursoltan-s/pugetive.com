require 'rails_helper'

feature "Tools management" do
  before(:each) do
    prepare_pugetive
  end

  scenario "destroying a tool should redirect back to index page"

end

feature "Viewing tool show pages" do
  before(:each) do
    prepare_pugetive
  end

  scenario "as a regular visitor" do
    prepare_software
    prepare_music

    tools = Tool.random(3)

    expect(tools.size).to eq 3
    tools.each do |tool|
      visit tool_path(tool)
      expect(page).to have_content tool.name
    end
  end

end
