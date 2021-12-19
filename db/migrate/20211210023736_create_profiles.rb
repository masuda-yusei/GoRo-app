class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :icon
      t.integer :gender
      t.date :birthday
      t.integer :residence
      t.text :introduction
      t.integer :golf_history
      t.integer :average_score
      t.integer :annual_round_time
      t.integer :playable_date
      t.integer :pick_up
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
