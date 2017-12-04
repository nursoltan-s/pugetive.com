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


end
