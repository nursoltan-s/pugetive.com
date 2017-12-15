require 'rails_helper'

describe Wield do
  before do
    setup_pugetive
    ruby = create(:tool, name: 'Ruby', interest_id: SOFTWARE_INTEREST_ID, type: 'Language')
    perl = create(:tool, name: 'Perl', interest_id: SOFTWARE_INTEREST_ID, type: 'Language')
    guitar = create(:tool, name: 'Guitar', interest_id: MUSIC_INTEREST_ID, type: 'Instrument')
    work = create(:work, interest_id: SOFTWARE_INTEREST_ID)
  end

  subject { Wield.new(tool_id: tool_id, work_id: work_id) }

  let :tool_id { Tool.software.first.id }
  let :work_id { Work.software.first.id }

  context 'when the tool and the work are of the same interest' do
    it { expect(subject).to be_valid }
  end

  context "when the tool and the work are of contrasting interests" do
    let :tool_id { Tool.music.first.id }
    it "should not be valid" do
      expect(subject).to be_invalid
    end
  end

end