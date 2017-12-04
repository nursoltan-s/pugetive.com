require 'rails_helper'

describe Tool do
  before(:each) do
    prepare_pugetive
  end

  it '#destroy should also destroy any associated wields' do
    tool = Tool.first
    wields = tool.wields
    expect(Wield.where(tool_id: tool.id).count).to be > 0

    tool.destroy

    expect(Wield.where(tool_id: tool.id).count).to eq 0
  end

  it '#resume_current should show resume-approved tools in active use' do
    tools = Tool.resume_current
    tool = tools.sample
    work = tool.works.first

    expect(tools.size).to be > 0
    expect(work.stop_year).to be > Time.now.year - 2
    expect(tool.resume?).to be true
  end

  it '#resume_lapsed should show resume-approved tools no longer in use' do
    tools = Tool.resume_lapsed
    tool = tools.sample
    work = tool.works.first

    expect(tools.size).to be > 0
    expect(work.stop_year).to be < Time.now.year - 1
    expect(tool.resume?).to be true
  end


end
