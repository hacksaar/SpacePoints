# encoding: UTF-8

## Definiert eine Belohnung, die eingelöst werden kann,
# z.B. 'Chipstüte' oder 'Bier'
class Reward < ActiveRecord::Base

  validates :points, :title, :presence => true

  validates :points, :numericality => {:greater_than => 0}

  has_attached_file :image, :styles => {:thumb => "22x22>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]  

  def earn(hacker, user = nil)
    hacker.redemptions.create({
      :user   => user,
      :points => self.points,
      :chronicle_text => self.title,
      :reward => self
    })
  end
end
