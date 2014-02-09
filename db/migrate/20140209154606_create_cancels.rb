class CreateCancels < ActiveRecord::Migration
  def change
    create_table :cancels do |t|
      t.integer :hacker_id
      t.integer :user_id
      t.integer :subject_id
      t.string :subject_type
      t.string :chronicle_text

      t.timestamps
    end
  end
end
