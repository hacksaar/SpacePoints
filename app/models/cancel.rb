# encoding: UTF-8


##
#
class Cancel < ActiveRecord::Base

  # Begünstigter
  belongs_to :hacker

  # Benutzer der diese Buchung durchführt hat
  belongs_to :user


  belongs_to(:subject, {
    :polymorphic => true
  })


  validates :subject_type, :inclusion => {:in => ['Redemption', 'Earning']}



  def points
    subject.points * (-1)
  end
end
