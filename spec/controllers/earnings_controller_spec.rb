require 'spec_helper'

describe EarningsController do

  let(:earning) { FactoryGirl.create(:earning) }
  let(:hacker) { FactoryGirl.create(:hacker, :cool_kim) }

  before do
    request.env['HTTP_REFERER'] = 'test.de'
  end

  context 'not logged in' do
    describe 'POST cancel' do
      it 'should allow to cancel' do
        earning.cancel.should be_blank
        post :cancel, :id => earning.id
        response.should be_redirect
        earning.reload.cancel.should be_present
        earning.cancel.user.should be_blank
      end 
    end # POST cancel
  end # not logged in

  context 'logged in' do
    before do
      controller.stub(:current_hacker).and_return(hacker)
    end
    describe 'POST cancel' do
      it 'should allow to cancel' do
        earning.cancel.should be_blank
        post :cancel, :id => earning.id
        response.should be_redirect
        earning.reload.cancel.should be_present
        earning.cancel.user.should be_eql(hacker)
      end 
    end # POST cancel
  end # logged in
end
