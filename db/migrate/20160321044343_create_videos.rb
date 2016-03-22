class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :thumbnail_path
      t.string :caption
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
