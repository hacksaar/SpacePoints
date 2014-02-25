require 'spec_helper'

describe Reward do
  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  let(:user) do
    FactoryGirl.create(:user)
  end

  subject do
    FactoryGirl.create(:reward)
  end

  it 'should earn a reward' do
    hacker.should have(0).redemptions
    subject.earn(hacker)
    hacker.reload.should have(1).redemptions
  end
end
