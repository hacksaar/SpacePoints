# encoding: UTF-8
require 'spec_helper'

describe RewardsController do
  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  let(:user) do
    FactoryGirl.create(:hacker)
  end

  let(:reward) do
    FactoryGirl.create(:reward)
  end

  before do
    request.env['HTTP_REFERER'] = 'test.de'
  end

  context 'not logged in' do
    describe 'POST earn' do
      it 'should earn a reward' do
        hacker.redemptions.should be_blank
        post :earn, :id => hacker.id, :reward => reward.id
        response.should be_redirect
        hacker.reload.should have(1).redemptions
        hacker.redemptions.last.user.should be_blank
      end
    end # POST earn
  end # not logged in

  context 'logged in' do
    before do
      controller.stub(:current_hacker).and_return(user)
    end
    describe 'POST earn' do
      it 'should earn a reward' do
        hacker.redemptions.should be_blank
        post :earn, :id => hacker.id, :reward => reward.id
        response.should be_redirect
        hacker.reload.should have(1).redemptions
        hacker.redemptions.last.user.should be_eql(user)
      end
    end # POST earn
  end # logged in
end
