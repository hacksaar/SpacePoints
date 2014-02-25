require 'spec_helper'

describe Redemption do

  let(:negative_points_redemption) do
    FactoryGirl.build(:redemption, {
      :points => - 50
    })
  end

  let(:redemption) do
    Redemption.new
  end

  let(:normal_redemption) do
    FactoryGirl.create(:redemption)
  end

  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  before do
    Redemption.any_instance.stub(:hacker_remaining_points).and_return(700)
  end

  context 'associations' do
    it 'should have a user which is instance of hacker' do
      redemption.build_user.should be_kind_of(Hacker)
    end
  end # associations

  context 'validations' do
    it 'should not allow negative points' do
      negative_points_redemption.should_not be_valid
      negative_points_redemption.errors[:points].should be_present
    end
  end # validations


  describe '#cancel!' do
    it 'should produce a cancel object' do
      normal_redemption.cancel.should be_blank
      normal_redemption.cancel!.should be_true
      normal_redemption.cancel.should be_present
    end

    it 'should allow anonym cancel' do
      normal_redemption.cancel!.should be_true
      normal_redemption.cancel.user.should be_blank
    end

    it 'should allow to cancel as user' do
      normal_redemption.cancel!(hacker).should be_true
      normal_redemption.cancel.user.should be(hacker)
    end
  end # #cancel!
end
