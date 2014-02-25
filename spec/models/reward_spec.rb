require 'spec_helper'

describe Reward do
  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  let(:user) do
    FactoryGirl.create(:user)
  end

  let(:earning) do
    FactoryGirl.create(:earning, {
      :hacker => hacker
    })
  end

  subject do
    FactoryGirl.create(:reward)
  end

  it 'should not earn a reward' do
    hacker.should have(0).redemptions
    subject.earn(hacker)
    hacker.reload.should have(0).redemptions
  end 

  context 'with earning' do
    before do
      earning
    end

    it 'should earn a reward' do
      hacker.should have(0).redemptions
      subject.earn(hacker)
      hacker.reload.should have(1).redemptions
    end 
  end # with earning
end
