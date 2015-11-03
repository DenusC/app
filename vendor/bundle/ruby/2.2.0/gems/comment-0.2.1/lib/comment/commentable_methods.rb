require 'active_record'

module Bravo
  module Commentable

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def has_comments
        has_many :comments, {:as => :commentable, :dependent => :destroy}

        class_eval %{
          def self.find_comments_for(obj)
            Comment.find_comments_for_commentable(self.base_class.name, obj.id)
          end

          def self.find_comments_by_user(user)
            commentable = self.base_class.name
            Comment.where(["user_id = ? and commentable_type = ?", user.id, commentable]).order("created_at DESC")
          end

          def comments_ordered_by_submitted
            Comment.find_comments_for_commentable(self.class.name, id)
         end

          def add_comments(comment)
             comments << comment
          end
        }
      end
    end
  end
end

ActiveRecord::Base.send(:include, Bravo::Commentable)
