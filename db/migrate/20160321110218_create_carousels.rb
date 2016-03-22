class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :name
      t.string :photo_path
      t.integer :priority
      t.text :caption
      t.string :url

      t.timestamps null: false
    end
  end
end
