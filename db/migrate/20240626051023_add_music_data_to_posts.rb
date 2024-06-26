class AddMusicDataToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :album_image, :string
    add_column :posts, :preview_url, :string
    add_column :posts, :artist_name, :string
    add_column :posts, :album_name, :string
    add_column :posts, :track_name, :string
  end
end
