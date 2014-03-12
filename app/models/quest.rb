# enconding: UTF-8

##
# Eine zu lösende Aufgabe, z.B. 'Müll rausbringen' oder 'Boden wischen'
class Quest < ActiveRecord::Base

  validates :points, :title, :presence => true

  validates :points, :numericality => {:greater_than => 0}

  has_attached_file(:image, {
    :styles => {:thumb => "22x22>" }, 
    :default_url => "/images/:style/missing.png"
  })

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]  

#  attr_accessible :title, :points, :description, :image

  def solve(hacker, user = nil)
    hacker.earnings.create({
      :user => user,
      :points => self.points,
      :quest  => self,
      :chronicle_text => self.title
    })
  end # #solve
end
