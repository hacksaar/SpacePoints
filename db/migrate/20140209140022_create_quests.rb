class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.integer :points
      t.string :title
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
