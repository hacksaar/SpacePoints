class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :points
      t.string :title
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
