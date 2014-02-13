# enconding: UTF-8

##
# Eine zu lösende Aufgabe, z.B. 'Müll rausbringen' oder 'Boden wischen'
class Quest < ActiveRecord::Base

  validates :points, :title, :presence => true

  validates :points, :numericality => {:greater_than => 0}

  def solve(hacker)
  end
end
