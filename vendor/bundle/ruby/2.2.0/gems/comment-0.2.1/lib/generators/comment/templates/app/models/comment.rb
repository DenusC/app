class Comment < ActiveRecord::Base
  include Bravo::Comment

  attr_accessible :content, :parent_id, :user, :commentable_id, :commentable_type

  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  validates_presence_of :content

  has_ancestry

  before_save :set_commentable

  def self.search(query)
    if query.blank?
      scoped
    else
      conditions = %w[content].map { |c| "comments.#{c} like :query" }
      where(conditions.join(" or "),:query => "%#{query}%")
    end
  end

  private
  def set_commentable
    if parent_id.present?
      parent = Comment.find(parent_id)
      self.commentable_id = parent.commentable_id
      self.commentable_type = parent.commentable_type
    end
  end

end
