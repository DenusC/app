#coding: utf-8
class CommentsController < ApplicationController

  def index
    @comments = Comment.search(params[:comment_search]).includes(:user).arrange(:order => "created_at asc")
    @comment = Comment.new(:user => current_user)
  end

  def new
    @comment = Comment.new(:parent_id => params[:parent_id], :user => current_user)
  end

  def create
    @comment = current_user.comments.build(params[:comment])
    #@comment.request = request
    if @comment.save
      flash.now[:notice] = "回复成功"
    end
    respond_to do |format|
      format.html do
        if @comment.errors.present?
          render :new
        else
          #@comment.notify_other_commenters
          redirect_to comments_path
        end
      end
      format.js
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update_attribute(:content, params[:comment][:content])
      flash.now[:notice] = "修改成功"
    end
    respond_to do |format|
      format.html do
        if @comment.errors.present?
          render :edit
        else
          redirect_to(episode_path(@comment.episode, :view => "comments"))
        end
      end
      format.js
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash.now[:notice] = "删除成功"
    respond_to do |format|
      #format.html { redirect_to episode_path(@comment.episode, :view => "comments") }
      format.js
    end
  end

  private

  def undo_link
    if can? :revert, :versions
      version = @comment.versions.scoped.last
      view_context.link_to("undo", revert_version_path(version), :method => :post) if can? :revert, version
    end
  end
end
