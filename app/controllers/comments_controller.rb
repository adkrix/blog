class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save!
    render json: {html: render_to_string(layout: false) }
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    render json: {result: true}
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end