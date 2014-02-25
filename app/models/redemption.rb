# encoding: UTF-8
## Chronik-Eintrag, wenn Punkte durch einen Hacker eingelöst wurden
## (Eintausch gegen Naturalien)
class Redemption < ActiveRecord::Base

  ###################
  ##  Validations  ##
  ###################


  validates :hacker_id, :reward_id, :points, :presence => true
  validates :points, :numericality => {:greater_than => 0}
  validates(:hacker_remaining_points, {
    :numericality => {
      :greater_than_or_equal_to => lambda {|i| i.points } 
    },
    :on => :create
  })


  #####################
  ##  Associactions  ##
  #####################


  # Begünstigter: Derjenige, dessen "Punktekonto" diese Punkte abgezogen werden
  # Beispiel:  User x ist angemeldet und löst für hacker y 10 Punkte ein, 
  # da hacker y sich eine Limo nimmt.
  belongs_to :hacker

  # Benutzer der diese Buchung durchführt hat
  belongs_to :user, :class_name => 'Hacker'

  belongs_to :reward

  has_one(:cancel, lambda { where(:subject_type => 'Redemption') }, {
    :foreign_key => :subject_id
  })


  delegate(:remaining_points, {
    :to     => :hacker, 
    :prefix => :hacker
  })


  def cancel!(hacker = nil)
    self.create_cancel({
      :user    => hacker,
      :subject => self,
      :chronicle_text => "Korrektur: #{self.chronicle_text}"
    })
  end
end
