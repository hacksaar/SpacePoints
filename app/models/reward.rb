# encoding: UTF-8

## Definiert eine Belohnung, die eingelöst werden kann,
# z.B. 'Chipstüte' oder 'Bier'
class Reward < ActiveRecord::Base

  validates :points, :title, :presence => true

  validates :points, :numericality => {:greater_than => 0}
end
