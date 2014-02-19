require 'spec_helper'

describe Hacker do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  let(:redemptions) do
    [FactoryGirl.create(:redemption, {
        :hacker => hacker, :points => 10
    }),
     FactoryGirl.create(:redemption, {
         :hacker => hacker, :points => 10
     })]
  end

  let (:cancel) do
    FactoryGirl.create(:cancel, {
        :hacker => hacker, :subject => redemptions[0]
    })
  end

  describe '#all_redeemed_points' do
    before do
      redemptions
    end

    it 'should sum all redemptions' do
      hacker.all_redeemed_points.should be(20)
    end

    context '#with cancel' do

      before do
        cancel
      end

      it 'should sum all redemptions without cancels' do
        hacker.all_redeemed_points.should be (10)
      end
    end
  end
  describe '#recent_earned_points'
  describe '#all_earned_points'
  # remaining_points

  #it all_redeemed_points
end

