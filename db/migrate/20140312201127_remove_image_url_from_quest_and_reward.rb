class RemoveImageUrlFromQuestAndReward < ActiveRecord::Migration
  def change
    change_table(:quests) do |t|
      t.remove :image_url
    end

    change_table(:rewards) do |t|
      t.remove :image_url
    end
  end
end
