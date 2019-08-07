class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを保存しました'
      redirect_to comment.board
    else
      redirect_to :back, flash: {
        comment: comment,
        error_message: comment.errors.full_messages
      }
    end
  end

  def destroy
  comment = Comment.find(params[:id])
  comment.delete
  redirect_to comment.board, flash: { notice: 'コメントが削除されました' }
  end
  private
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end


end
