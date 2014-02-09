
class RedemptionsController < ApplicationController
  before_filter :set_redemption, :only => [:cancel]

  def cancel
    @redemption.cancel!

    redirect_to :back
  end

  protected

  def set_redemption
    @redemption = Redemption.find(params[:id])
  end
end
