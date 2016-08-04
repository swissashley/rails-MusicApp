class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :track_type, null: false
      t.text :lyric
      t.integer :album_id, null: false
      t.timestamps
    end
    add_index :tracks, :album_id
  end
end
