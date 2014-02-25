class HackersController < ApplicationController
  before_filter :set_hackers, :only => [:index]
  before_filter :set_hacker,  :only => [:show]

  before_filter :set_quests,  :only => [:show]
  before_filter :set_rewards, :only => [:show]
  before_filter :set_chronicle, :only => [:show]

  before_filter :authenticate_user!, :only => [:edit, :update]


  def index

  end

  def show
    
  end

  def edit
    current_hacker
  end


  private

  def set_hackers
    @hackers = Hacker.all
  end

  def set_hacker
    @hacker = Hacker.find(params[:id])
  end

  def set_quests
    @quests = Quest.all
  end

  def set_rewards
    @rewards = Reward.all
  end

  def set_chronicle
    @chronicle = (@hacker.earnings.all + @hacker.redemptions.all).sort do |a,b|
      b.created_at <=> a.created_at
    end
  end
end
