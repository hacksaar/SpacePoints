
class ChroniclesController < ApplicationController

  before_filter :set_chronicle, :only => [:show]


  def show
  
  end

  protected

  def set_chronicle
    @chronicle = (Earning.all + Redemption.all).sort do |a,b|
      a.created_at <=> b.created_at
    end
  end
end
