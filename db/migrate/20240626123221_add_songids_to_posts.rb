class AddSongidsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :artist_id, :string
    add_column :posts, :album_id, :string
  end
end
