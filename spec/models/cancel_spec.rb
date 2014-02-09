require 'spec_helper'

describe Cancel do
  context 'validations' do
    it 'should not allow Hacker as subject' do
      cancellation = Cancel.new(:subject_type => 'Hacker')
      cancellation.should_not be_valid
      cancellation.errors[:subject_type].should be_present
    end

    it 'should allow Redemption as subject' do
      cancellation = Cancel.new(:subject_type => 'Redemption')
      cancellation.should be_valid
      cancellation.errors[:subject_type].should be_blank
    end

    it 'should allow Earning as subject' do
      cancellation = Cancel.new(:subject_type => 'Earning')
      cancellation.should be_valid
      cancellation.errors[:subject_type].should be_blank
    end
  end # validations
end
