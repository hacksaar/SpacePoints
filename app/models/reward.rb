# encoding: UTF-8

## Definiert eine Belohnung, die eingelöst werden kann,
# z.B. 'Chipstüte' oder 'Bier'
class Reward < ActiveRecord::Base

  validates :points, :title, :presence => true

  validates :points, :numericality => {:greater_than => 0}

  def earn(hacker, user = nil)
    hacker.redemptions.create({
      :user   => user,
      :points => self.points,
      :chronicle_text => self.title,
      :reward => self
    })
  end
end
