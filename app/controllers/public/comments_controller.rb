class Public::CommentsController < ApplicationController
  def new
    @post_image = PostImage.find(params[:post_image_id])
    @comment = Comment.new
  end

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    flash[:notice] = "投稿が成功しました"
    redirect_to post_image_path(post_image.id)
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
    redirect_to post_image_comment_path(@comment.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "削除しました"
    redirect_to users_comments_path(current_user.id)
  end

private

  def comment_params
params.require(:comment).permit(:comment_content)
  end
end
