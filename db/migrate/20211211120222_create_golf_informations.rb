class CreateGolfInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :golf_informations do |t|
      t.integer :golf_history
      t.integer :average_score
      t.integer :annual_round_times
      t.date :playable_date
      t.string :pick_up
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
