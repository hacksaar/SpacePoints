# encoding: UTF-8
require 'spec_helper'

describe QuestsController do
  let(:hacker) do
    FactoryGirl.create(:hacker)
  end

  let(:user) do
    FactoryGirl.create(:hacker)
  end

  let(:quest) do
    FactoryGirl.create(:quest)
  end

  before do
    request.env['HTTP_REFERER'] = 'test.de'
  end

  context 'not logged in' do
    describe 'POST solve' do
      it 'should solve a quest' do
        hacker.earnings.should be_blank
        post :solve, :id => hacker.id, :quest => quest.id
        hacker.reload.should have(1).earnings
        hacker.earnings.last.user.should be_blank
      end
    end # POST solve
  end # not logged in

  context 'logged in' do
    before do
      controller.stub(:current_hacker).and_return(user)
    end
    describe 'POST solve' do
      it 'should solve a quest' do
        hacker.earnings.should be_blank
        post :solve, :id => hacker.id, :quest => quest.id
        hacker.reload.should have(1).earnings
        hacker.earnings.last.user.should be_eql(user)
      end
    end # POST solve
  end # logged in
end
