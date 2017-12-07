require 'rails_helper'

feature "Viewing Tool pages" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_software
    setup_music

    tools = Tool.random(3)

    expect(tools.size).to eq 3
    tools.each do |tool|
      visit tool_path(tool)

      expect(page).to have_content tool.name
    end
  end

end
