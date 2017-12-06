require 'rails_helper'

describe Tool, '#destroy' do
  before(:each) do
    prepare_pugetive
    prepare_software
  end

  it 'destroys any associated wields' do
    tool = create(:tool, name: 'Perl', type: 'Language', category: 'Software')
    app  = create(:app,  name: 'Catsubst Macro DB')
    app.tools << tool

    expect(app.tools.size).to be 1

    tool.destroy

    expect(Wield.where(tool_id: tool.id).count).to eq 0
  end
end

describe Tool, '#resume_current' do
  before(:each) do
    prepare_pugetive
    prepare_software
  end

  it 'shows resume-approved tools in active use' do
    tools = Tool.resume_current
    tool = tools.sample
    work = tool.works.first

    expect(tools.size).to be > 0
    stop = work.stop_year.nil? ? Time.now.year : work.stop_year
    expect(stop).to be > Time.now.year - 2
    expect(tool.resume?).to be true
  end
end

describe Tool, '#resume_lapsed' do
  before(:each) do
    prepare_pugetive
    prepare_software
  end

  it 'shows resume-approved tools no longer in use' do
    tools = Tool.resume_lapsed
    tool = tools.sample
    work = tool.works.first

    expect(tools.size).to be > 0
    expect(work.stop_year).to be < Time.now.year - 1
    expect(tool.resume?).to be true
  end


end
