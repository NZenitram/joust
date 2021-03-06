class Api::V1::CommentsController < ApiController

  def create
    comment = current_user.comments.new(comment_params)
    if comment.save
      render json: comment, status: 200
    else
      render body: nil, status: 400
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:winner, :loser, :comment, :user_id)
  end
end
