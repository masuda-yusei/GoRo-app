class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :icon
      t.integer :gender
      t.date :birthday
      t.integer :residence
      t.text :introduction
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
