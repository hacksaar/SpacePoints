class Hacker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, :uniqueness => true, :presence => true

  has_many :earnings,    :foreign_key => :hacker_id
  has_many :redemptions, :foreign_key => :hacker_id


  ######################
  ## Instance Methods ##
  ######################

  # Summe aller jemals eingelösten Punkte
  def all_redeemed_points
    return Redemption.sum('points')
  end

  # Summe aller in den letzten 90 Tagen verdienten Punkte
  def recent_earned_points
    return Reward.where('created_at >= ?', Date.today - 90).sum('points')
  end

  # Summe aller jemals verdienten Punkte, 
  # unabhängig davon, ob diese bereits 
  # eingelöst wurden oder nicht
  def all_earned_points
    return Reward.sum('points')
  end
  
  # Verbleibendes Guthaben, d.h. alle jemals verdienten Punkte
  # abzüglich aller jemals eingelösten Punkte,
  def remaining_points
    return all_earned_points - all_redeemed_points
  end
end
