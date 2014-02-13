
class EarningsController < ApplicationController
  before_filter :set_earning, :only => [:cancel]

  # TODO user should be set
  def cancel
    if hacker_signed_in?
    @earning.cancel!(current_hacker)
    else
      @earning.cancel!
    end
    redirect_to :back
  end


  protected

  def set_earning
    @earning = Earning.find(params[:id])
  end
end
