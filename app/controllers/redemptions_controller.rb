
class RedemptionsController < ApplicationController
  before_filter :set_redemption, :only => [:cancel]

  def cancel
    if @redemption.cancel!
      flash[:warning] = "#{@redemption.reward.title} vom #{I18n.l(@redemption.created_at, :format => :short)} storniert"
    end

    redirect_to :back
  end

  protected

  def set_redemption
    @redemption = Redemption.find(params[:id])
  end
end
