# encoding: UTF-8

##
# Chronik-Eintrag, falls ein Quest durch einen Hacker gelöst wurde
class Earning < ActiveRecord::Base

  # Begünstigter: Derjenige, für den die Punkte eingelöst werden,
  # z.B. User x löst für hacker y 10 Punkte ein, da sich hacker y
  # eine Limo geholt hat.
  belongs_to :hacker


  # Benutzer der diese Buchung durchführt hat
  belongs_to :user, :class_name => 'Hacker'

  belongs_to :quest

  has_one(:cancel, lambda { where(:subject_type => 'Earning') }, {
    :foreign_key => :subject_id
  })


  def cancel!
    self.create_cancel({
      :subject => self,
      :chronicle_text => "Korrektur: #{self.chronicle_text}"
    })
  end
end
