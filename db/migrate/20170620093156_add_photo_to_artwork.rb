class AddPhotoToArtwork < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :photo, :string
  end
end
