class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit]

  def index
    @comments = Comment.all.page(params[:page]).order(created_at: :desc)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = "更新しました"
    redirect_to admin_comment_path(@comment.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
