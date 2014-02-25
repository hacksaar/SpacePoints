# encoding: UTF-8
#
class QuestsController < ApplicationController


  before_filter :set_hacker, :only => [:solve]
  before_filter :set_quest,  :only => [:solve]


  ######################
  ##  Member Methods  ##
  ######################

  def solve
    if @quest.solve(@hacker, current_hacker)
      flash[:success] = "#{@quest.title}: #{@hacker.nickname} wurden #{@quest.points} Punkte gutgeschrieben."
    else
      flash[:error]   = "Die Punkte für #{@quest.title} konnten nicht gutgeschrieben werden."
    end
    redirect_to :back
  end


  #################
  ##  Protected  ##
  #################

  protected

  def set_quest
    @quest = Quest.find(params[:quest])
  end # #set_quest

  # Da Nested wird der Hacker hier mit ID übermittelt
  def set_hacker
    @hacker = Hacker.find(params[:id])
  end # #set_hacker

end
