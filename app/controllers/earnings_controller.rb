
class EarningsController < ApplicationController

  before_filter :set_earning, :only => [:cancel]


  # TODO user should be set
  def cancel
    @earning.cancel!(current_hacker)
    redirect_to :back
  end


  #################
  ##  Protected  ##
  #################

  protected

  def set_earning
    @earning = Earning.find(params[:id])
  end
end
