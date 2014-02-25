
class EarningsController < ApplicationController

  before_filter :set_earning, :only => [:cancel]

  # TODO user should be set
  def cancel
    if @earning.cancel!(current_hacker)
      flash[:warning] = "#{@earning.quest.title} vom #{I18n.l(@earning.created_at, :format => :short)} storniert."
    end
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