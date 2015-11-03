class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.string :role, :default => "comments"
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :user_id
  end

  def self.down
    drop_table :comments
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      add_column :comments, :ancestry, :string
      t.references :user
      t.references :commentable, :polymorphic => true
      #add_column :comments, :commentable_id, :integer
      #add_column :comments, :commentable_type, :string
      #t.string :role, :default => "comments"
      t.timestamps

      add_index :comments, :commentable_type
      add_index :comments, :commentable_id
      add_index :comments, :user_id
    end
  end
end
