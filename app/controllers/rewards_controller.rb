# encoding: UTF-8
#
class RewardsController < ApplicationController


  before_filter :set_hacker, :only => [:earn]
  before_filter :set_reward, :only => [:earn]


  ######################
  ##  Member Methods  ##
  ######################

  def earn
    redemption = @reward.earn(@hacker, current_hacker)
    if redemption.valid?
      flash[:success] = "#{redemption.reward.title} eingelöst"
    else
      flash[:error]   = "#{redemption.reward.title} konnte nicht eingelöst werden\n"
      flash[:error]   << redemption.errors.full_messages * "\n"
    end
    redirect_to :back
  end

  #########################
  ##  Protected Methods  ##
  #########################

  protected

  def set_reward
    @reward = Reward.find(params[:reward])
  end # #set_quest

  # Da Nested wird der Hacker hier mit ID übermittelt
  def set_hacker
    @hacker = Hacker.find(params[:id])
  end # #set_hacker
end
