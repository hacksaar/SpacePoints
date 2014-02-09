class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.integer :hacker_id
      t.integer :user_id
      t.integer :reward_id
      t.integer :points
      t.string :chronicle_text

      t.timestamps
    end
  end
end
