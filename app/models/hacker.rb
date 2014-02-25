class Hacker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, :uniqueness => true, :presence => true

  has_many :earnings,    :foreign_key => :hacker_id
  has_many :redemptions, :foreign_key => :hacker_id

  has_many :earning_cancels,    :through => :earnings,    :source => :cancel
  has_many :redemption_cancels, :through => :redemptions, :source => :cancel

  ######################
  ## Instance Methods ##
  ######################
  #
  
  def redemptions_without_cancel
    return redemptions.
      where(
        Redemption.arel_table[:id].not_in(
          self.redemption_cancels.map(&:subject_id)
        )
      )
  end

  # Summe aller jemals eingelösten Punkte
  def all_redeemed_points
    return redemptions_without_cancel.sum('points')
  end

  def earnings_without_cancel
    return earnings.
      where(
        Earning.arel_table[:id].not_in(
          self.earning_cancels.map(&:subject_id)
        )
      )
  end

  # Summe aller jemals verdienten Punkte, 
  # unabhängig davon, ob diese bereits 
  # eingelöst wurden oder nicht
  def all_earned_points
    return earnings_without_cancel.sum('points')
  end

  # Summe aller in den letzten 90 Tagen verdienten Punkte
  def recent_earned_points
    return earnings_without_cancel.
        where('created_at >= ?', Date.today - 90).sum('points')
  end

  
  # Verbleibendes Guthaben, d.h. alle jemals verdienten Punkte
  # abzüglich aller jemals eingelösten Punkte,
  def remaining_points
    return all_earned_points - all_redeemed_points
  end
end
