require 'spec_helper'

describe Quest do


  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  subject do
    FactoryGirl.build(:quest)
  end


  describe '#solve' do
    it 'should produce a reward' do
      hacker.should have(0).earnings
      subject.solve(hacker)
      hacker.reload.should have(1).earnings
      hacker.earnings.first.quest.should be_eql(subject)
    end

    it 'should produce text into reward'
    it 'should assign reward to quest'
  end # #solve
end
