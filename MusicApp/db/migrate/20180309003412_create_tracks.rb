class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.string :album_id, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :bonus, default: false

      t.timestamps
    end

    add_index :tracks, %i(album_id ord), unique: true
  end
end
