# encoding: UTF-8
#
class QuestsController < ApplicationController


  before_filter :set_hacker, :only => [:solve]
  before_filter :set_quest,  :only => [:solve]


  ######################
  ##  Member Methods  ##
  ######################

  def solve
    @quest.solve(hacker, current_user)
  end


  #################
  ##  Protected  ##
  #################

  protected

  def set_quest
    @quest = Quest.find(params[:id])
  end # #set_quest

  def set_hacker
    @hacker = Hacker.find(params[:hacker_id])
  end # #set_hacker

end
