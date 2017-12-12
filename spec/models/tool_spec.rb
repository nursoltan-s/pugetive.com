require 'rails_helper'

describe Tool do
   before(:all) do
     setup_pugetive
     setup_software
   end

  describe '#destroy' do
    it 'destroys any associated wields' do
      tool = create(:tool, name: 'Perl', type: 'Language', interest_id: SOFTWARE_INTEREST_ID)
      app  = create(:app,  name: 'Catsubst Macro DB')
      app.tools << tool

      expect(app.tools.size).to be 1

      tool.destroy

      expect(Wield.where(tool_id: tool.id).count).to eq 0
    end
  end

  describe '#resume_current' do
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

  describe '#resume_lapsed' do
    it 'shows resume-approved tools no longer in use' do
      tools = Tool.resume_lapsed
      tool = tools.sample
      work = tool.works.first

      expect(tools.size).to be > 0
      expect(work.stop_year).to be < Time.now.year - 1
      expect(tool.resume?).to be true
    end

  end

  after(:all) do
    clean_db
  end
end