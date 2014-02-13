require 'spec_helper'

describe Earning do
  let(:earning) do
    FactoryGirl.create(:earning, {
    })
  end

  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  describe '#cancel!' do
    it 'should create a cancel Object' do
      earning.cancel.should be_blank
      earning.cancel!.should be_true
      earning.cancel.should be_present
      Cancel.should have(1).cancel
    end

    it 'should cancel by a given user' do
      earning.cancel!(hacker)
      earning.cancel.should be_present
      earning.cancel.user.should be(hacker)
    end
  end # #cancel!
end
