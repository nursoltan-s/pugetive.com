require 'rails_helper'

describe Role do
  before do
    setup_pugetive
    founder   = create(:title, name: 'Founder',   interest_id: SOFTWARE_INTEREST_ID)
    developer = create(:title, name: 'Developer', interest_id: SOFTWARE_INTEREST_ID)
    director  = create(:title, name: 'Director',  interest_id: FILM_INTEREST_ID)

    work = create(:work, name: 'Hopville', interest_id: SOFTWARE_INTEREST_ID)
  end

  subject { Role.new(title_id: title_id, work_id: work_id) }

  let :title_id { Title.software.sample.id }
  let :work_id  { Work.software.sample.id }

  context 'when the role and the work are of the same interest' do
    it { expect(subject).to be_valid }
  end

  context "when the role and the work are of contrasting interests" do
    let :title_id { Title.film.sample.id }
    it "should not be valid" do
      expect(subject).to be_invalid
    end
  end

end