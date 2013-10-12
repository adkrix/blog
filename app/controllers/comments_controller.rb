class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render controller: 'posts', action: 'show', id: @comment.post_id
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    render json: {result: true}
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end