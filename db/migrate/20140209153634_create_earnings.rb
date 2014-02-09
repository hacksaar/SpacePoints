class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.integer :hacker_id
      t.integer :user_id
      t.integer :quest_id
      t.integer :points
      t.string :chronicle_text

      t.timestamps
    end
  end
end
