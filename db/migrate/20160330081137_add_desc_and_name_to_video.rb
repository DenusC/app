class AddDescAndNameToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :desc, :text
    add_column :videos, :name, :string
  end
end
