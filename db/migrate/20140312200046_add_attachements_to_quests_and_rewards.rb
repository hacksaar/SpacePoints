class AddAttachementsToQuestsAndRewards < ActiveRecord::Migration
  def change
    add_attachment :quests, :image
    add_attachment :rewards, :image
  end
end
