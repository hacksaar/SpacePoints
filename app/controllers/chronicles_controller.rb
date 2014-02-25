
class ChroniclesController < ApplicationController

  before_filter :set_chronicle, :only => [:show]


  def show
  
  end

  protected

  def set_chronicle
    @chronicle = (Earning.all + Redemption.all).sort do |a,b|
      b.created_at <=> a.created_at
    end

    @chronicle = Kaminari.paginate_array(
      @chronicle
    ).page(params[:page]).per(20)
  end
end
