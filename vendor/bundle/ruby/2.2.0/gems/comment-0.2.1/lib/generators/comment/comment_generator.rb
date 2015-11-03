require 'rails/generators/migration'

class CommentGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_model_file
    template "app/models/comment.rb"
    migration_template "create_comments.rb", "db/migrate/create_comments.rb"
  end

  def create_route
    route("resources :comments")
  end

  def create_controller_file
    template 'app/controllers/comments_controller.rb'
  end

  def create_views
    directory "app/views/comments/"

    inside "app/views/comments" do
      template "_comment.html.erb"
      template "_comment_headline.html.erb"
      template "_form.html.erb"
      template "create.js.erb"
      template "destroy.js.erb"
      template "edit.js.erb"
      template "index.html.erb"
      template "new.js.erb"
      template "update.js.erb"
    end
  end

end
