require 'spec_helper'

describe Earning do
  let(:earning) do
    FactoryGirl.create(:earning, {
    })
  end

  describe '#cancel!' do
    it 'should create a cancel Object' do
      earning.cancel.should be_blank
      earning.cancel!.should be_true
      earning.cancel.should be_present
    end
  end # #cancel!
end
